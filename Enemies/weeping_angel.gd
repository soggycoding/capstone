extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
@onready var detection_area = $DetectionArea
@export var patrol_speed = 15
@export var chase_speed = 30
@export var detection_range = 300
@export var vision_range = 200  # Add this!
@export var look_angle = 45

var player: CharacterBody2D
var current_speed = patrol_speed
var state = "patrol"
var current_direction = Vector2.DOWN
var active = false

func _ready() -> void:
	player = get_parent().get_node("CharacterBody2D")
	if player:
		detection_area.area_entered.connect(_on_detection_area_entered)
		print("Weeping Angel ready!")
	else:
		print("ERROR: Player not found!")

func _physics_process(delta: float) -> void:
	if not active:
		return
	
	var distance_to_player = global_position.distance_to(player.global_position)
	
	if is_player_looking_at_me():
		state = "freeze"
		velocity = Vector2.ZERO
		play_idle_animation()
	else:
		if distance_to_player < detection_range:
			state = "chase"
			current_speed = chase_speed
		else:
			state = "patrol"
			current_speed = patrol_speed
		
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * current_speed
		current_direction = direction
		play_movement_animation(direction)
	
	move_and_slide()

func play_movement_animation(direction: Vector2) -> void:
	if direction.x < -0.3:
		sprite.play("walk_left")
	elif direction.x > 0.3:
		sprite.play("walk_right")
	elif direction.y < -0.3:
		play_idle_animation()
	elif direction.y > 0.3:
		play_idle_animation()

func play_idle_animation() -> void:
	if current_direction.y < 0:
		sprite.play("idle_back")
	else:
		sprite.play("idle_front")

func is_player_looking_at_me() -> bool:
	var distance_to_player = global_position.distance_to(player.global_position)
	
	if distance_to_player > vision_range:
		return false
	
	var direction_to_enemy = (global_position - player.global_position).normalized()
	var player_facing = player.last_direction
	var angle = player_facing.angle_to(direction_to_enemy)
	angle = abs(angle)
	
	return angle < deg_to_rad(look_angle)

func _on_detection_area_entered(area: Area2D) -> void:
	pass
