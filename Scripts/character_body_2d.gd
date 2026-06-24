extends CharacterBody2D

@onready var pause_menu = get_parent().get_node("HUDLayer/PauseMenu")
@onready var flash_light: PointLight2D = $VisionCone/flashlight
@onready var flashlight_cone = $VisionCone
@onready var walk_sprite = $WalkSprite
@onready var run_sprite = $RunSprite
@onready var noise_bar = $CanvasLayer/NoiseBar
@onready var noise_label = $CanvasLayer/NoiseLabel

var is_paused = false
var flashlight_enabled = false

const max_speed: int = 30
const sprint_speed: int = 50
const crouch_speed: int = 10
const acceleration: int = 4
const friction: int = 8

var noise_level: float = 0.0
var max_noise: float = 100.0
var current_speed: int = max_speed
var last_direction: Vector2 = Vector2.DOWN

func _input(event: InputEvent) -> void:
	# Right click to toggle flashlight on/off
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			flashlight_enabled = !flashlight_enabled
			flash_light.enabled = flashlight_enabled
			print("Flashlight: ", "ON" if flashlight_enabled else "OFF")
			get_tree().root.set_input_as_handled()

func _physics_process(delta: float) -> void:
	add_to_group("player")
	
	if Input.is_action_just_pressed("ui_cancel"):
		toggle_pause()
	
	if get_tree().paused:
		return
	
	# Update flashlight to follow player direction
	if flashlight_enabled:
		update_flashlight_position()
	
	var input = Vector2(
		Input.get_action_raw_strength("ui_right") - Input.get_action_raw_strength("ui_left"),
		Input.get_action_raw_strength("ui_down") - Input.get_action_raw_strength("ui_up")
	).normalized()
	
	var is_sprinting = Input.is_action_pressed("sprint") and input != Vector2.ZERO
	
	# Update last direction if moving
	if input != Vector2.ZERO:
		last_direction = input
	
	if is_sprinting:
		max_noise = 100.0
	
	# SHOW/HIDE SPRITES BASED ON STATE
	if is_sprinting:
		show_sprite("run")
		current_speed = sprint_speed
		update_noise(delta, 20)
		if input != Vector2.ZERO:
			play_movement_animation(input, "run")
	elif input != Vector2.ZERO:
		show_sprite("walk")
		current_speed = max_speed
		update_noise(delta, -2)
		play_movement_animation(input, "walk")
	else:
		show_sprite("walk")
		update_noise(delta, -20)
		play_idle_animation(last_direction)
	
	noise_level = clamp(noise_level, 0, max_noise)
	
	if noise_level >= 100:
		trigger_siren_head_alert()
		
	var lerp_weight = delta * (acceleration if input else friction)
	velocity = lerp(velocity, input * current_speed, lerp_weight)
	
	move_and_slide()
	update_noise_ui()

func update_flashlight_position() -> void:
	"""Point flashlight in direction player is facing"""
	# Position flashlight ahead of player in facing direction
	$VisionCone.global_position = global_position + last_direction * 30
	
	# Rotate to face direction (add offset if cone doesn't point right by default)
	$VisionCone.rotation = last_direction.angle()

func show_sprite(state: String) -> void:
	walk_sprite.visible = (state == "walk")
	run_sprite.visible = (state == "run")

func play_movement_animation(direction: Vector2, state: String) -> void:
	var sprite = run_sprite if state == "run" else walk_sprite
	
	if direction.y < 0:
		sprite.play("run_up" if state == "run" else "walk_up")
	elif direction.y > 0:
		sprite.play("run_down" if state == "run" else "walk_down")
	elif direction.x < 0:
		sprite.play("run_left" if state == "run" else "walk_left")
	elif direction.x > 0:
		sprite.play("run_right" if state == "run" else "walk_right")

func play_idle_animation(direction: Vector2) -> void:
	var sprite = walk_sprite
	
	if direction.y < 0:
		sprite.play("idle_up")
	elif direction.y > 0:
		sprite.play("idle_down")
	elif direction.x < 0:
		sprite.play("idle_left")
	elif direction.x > 0:
		sprite.play("idle_right")

func update_noise(delta: float, noise_rate: float) -> void:
	noise_level += noise_rate * delta

func trigger_siren_head_alert() -> void:
	print("SIREN HEAD ALERT!")

func update_noise_ui() -> void:
	"""Update noise meter display"""
	noise_bar.value = noise_level
	noise_label.text = str(int(noise_level))
	
	if noise_level > 70:
		noise_bar.modulate = Color.RED
	elif noise_level > 40:
		noise_bar.modulate = Color.YELLOW
	else:
		noise_bar.modulate = Color.GREEN

func toggle_pause() -> void:
	get_tree().paused = !get_tree().paused
	pause_menu.visible = get_tree().paused
