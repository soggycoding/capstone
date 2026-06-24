extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
@onready var detection_area = $DetectionArea
@export var patrol_speed = 20	
@export var chase_speed = 30
@export var vision_range = 100
@export var vision_angle = 30  # Cone width in degrees
@export var patrol_zone_radius = 150  # Max distance from origin

var player: CharacterBody2D
var current_speed = patrol_speed
var state = "patrol"  # patrol, chase
var current_direction = Vector2.DOWN
var active = false
var spawn_points = []

# Patrol waypoints
var waypoints = []
var current_waypoint = 0
var patrol_origin = Vector2.ZERO

func _ready() -> void:
	player = get_parent().get_node("CharacterBody2D")
	patrol_origin = global_position
	
	if player:
		detection_area.area_entered.connect(_on_detection_area_entered)
		print("Shadow Patrol ready at: ", patrol_origin)
	else:
		print("ERROR: Player not found!")

func set_waypoints(points: Array) -> void:
	"""Set patrol waypoints"""
	waypoints = points
	if waypoints.size() > 0:
		current_waypoint = 0

func _physics_process(delta: float) -> void:
	if not active:
		return
	
	var distance_to_player = global_position.distance_to(player.global_position)
	
	# Check if player is in vision cone
	if can_see_player():
		state = "chase"
		current_speed = chase_speed
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * current_speed
		current_direction = direction
		play_movement_animation(direction)
	else:
		state = "patrol"
		current_speed = patrol_speed
		patrol_to_waypoints()
	
	# Rotate vision cone to face current direction
	if has_node("VisionCone"):
		$VisionCone.rotation = current_direction.angle()
	
	move_and_slide()

func can_see_player() -> bool:
	"""Check if player is in cone of vision"""
	var distance_to_player = global_position.distance_to(player.global_position)
	
	# Must be within vision range
	if distance_to_player > vision_range:
		return false
	
	# Must be within vision cone
	var direction_to_player = (player.global_position - global_position).normalized()
	var angle = current_direction.angle_to(direction_to_player)
	angle = abs(angle)
	
	return angle < deg_to_rad(vision_angle)

func patrol_to_waypoints() -> void:
	"""Move to waypoints in order"""
	if waypoints.size() == 0:
		velocity = Vector2.ZERO
		return
	
	var target = waypoints[current_waypoint]
	var distance_to_waypoint = global_position.distance_to(target)
	
	if distance_to_waypoint < 30:
		# Reached waypoint, move to next
		current_waypoint = (current_waypoint + 1) % waypoints.size()
	
	var direction = global_position.direction_to(target)
	velocity = direction * current_speed
	current_direction = direction
	play_movement_animation(direction)

func play_movement_animation(direction: Vector2) -> void:
	"""Play animation based on movement direction (up, down, left, right)"""
	if direction.y < -0.3:  # Moving up
		sprite.play("up")
	elif direction.y > 0.3:  # Moving down
		sprite.play("down")
	elif direction.x < -0.3:  # Moving left
		sprite.play("left")
	elif direction.x > 0.3:  # Moving right
		sprite.play("right")

func _on_detection_area_entered(area: Area2D) -> void:
	pass
