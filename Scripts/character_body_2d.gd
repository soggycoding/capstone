extends CharacterBody2D

@onready var animationplayer: AnimationPlayer = $Sprite2D/AnimationPlayer

const max_speed: int = 30
const acceleration: int = 5
const friction: int = 8

func _physics_process(delta: float) -> void:
	var input = Vector2(
		Input.get_action_raw_strength("ui_right") - Input.get_action_raw_strength("ui_left"),
		Input.get_action_raw_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	
	if input != Vector2.ZERO:
		play_walk_animation(input)
		animationplayer.speed_scale	 = (velocity / max_speed).length() + 0.5
	else: 
		play_idle_animation()
	
	var lerp_weight = delta * (acceleration if input else friction)
	velocity = lerp(velocity, input * max_speed, lerp_weight)
	
	move_and_slide()
	
func play_walk_animation(direction: Vector2) -> void:
	if direction.y < 0:
		animationplayer.play("up")
	elif direction.y > 0:
		animationplayer.play("down")
	elif direction.x < 0:
		animationplayer.play("left")
	elif direction.x > 0:
		animationplayer.play("right")

func play_idle_animation() -> void:
	var current_anim = animationplayer.current_animation
	
	match current_anim:
		"up":
			animationplayer.play("up-idle")
		"down":
			animationplayer.play("down-idle")
		"left":
			animationplayer.play("left-idle")
		"right":
			animationplayer.play("right-idle")
