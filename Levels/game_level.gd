extends Node2D

@onready var weeping_angel_scene = preload("res://Enemies/weeping_angel.tscn")
@onready var slenderman_scene = preload("res://Enemies/slender_man.tscn")
@onready var shadow_patrol_scene = preload("res://Enemies/shadow_patrol.tscn")
@onready var spawn_points = [
	$SpawnPoint1.global_position,
	$SpawnPoint2.global_position,
	$SpawnPoint3.global_position,
]
@onready var player = $CharacterBody2D

var weeping_angel: CharacterBody2D
var slenderman: CharacterBody2D
var shadow_patrol: CharacterBody2D  # ADD THIS
var enemies_activated = false

func _ready() -> void:
	# Spawn Weeping Angel
	var random_spawn = spawn_points[randi() % spawn_points.size()]
	weeping_angel = weeping_angel_scene.instantiate()
	add_child(weeping_angel)
	weeping_angel.global_position = random_spawn
	weeping_angel.active = false
	
	# Spawn Shadow Patrol - CHANGE var shadow TO shadow_patrol
	shadow_patrol = shadow_patrol_scene.instantiate()
	add_child(shadow_patrol)
	shadow_patrol.global_position = Vector2(500, 400)
	shadow_patrol.active = false
	shadow_patrol.set_waypoints([
		Vector2(200, 200),
		Vector2(800, 200),
		Vector2(800, 600),
		Vector2(200, 600),
	])
	
	# Spawn Slenderman
	var slenderman_spawn = spawn_points[randi() % spawn_points.size()]
	while slenderman_spawn == random_spawn:
		slenderman_spawn = spawn_points[randi() % spawn_points.size()]
	
	slenderman = slenderman_scene.instantiate()
	add_child(slenderman)
	slenderman.global_position = slenderman_spawn
	slenderman.active = false
	slenderman.spawn_points = spawn_points
	
	print("Shadow spawned at: ", shadow_patrol.global_position)
	print("Waypoints set: ", shadow_patrol.waypoints)
	
	await get_tree().create_timer(0.5).timeout
	weeping_angel.active = true
	slenderman.active = true
	shadow_patrol.active = true  # ACTIVATE IT!
	print("All enemies activated!")

func _physics_process(delta: float) -> void:
	if get_tree().get_frame() % 60 == 0:
		print("Shadow position: ", shadow_patrol.global_position)
