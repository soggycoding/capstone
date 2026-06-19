extends Node2D

@onready var weeping_angel_scene = preload("res://Enemies/weeping_angel.tscn")
@onready var slenderman_scene = preload("res://Enemies/slender_man.tscn")
@onready var spawn_points = [
	$SpawnPoint1.global_position,
	$SpawnPoint2.global_position,
	$SpawnPoint3.global_position,
]
@onready var activation_zone = $ActivationZone

var weeping_angel: CharacterBody2D
var slenderman: CharacterBody2D
var can_activate = false

func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	can_activate = true
	
	var random_spawn = spawn_points[randi() % spawn_points.size()]
	weeping_angel = weeping_angel_scene.instantiate()
	add_child(weeping_angel)
	weeping_angel.global_position = random_spawn
	
	# Spawn Slenderman at different point
	var slenderman_spawn = spawn_points[randi() % spawn_points.size()]
	while slenderman_spawn == random_spawn:
		slenderman_spawn = spawn_points[randi() % spawn_points.size()]
	
	slenderman = slenderman_scene.instantiate()
	add_child(slenderman)
	slenderman.global_position = slenderman_spawn
	slenderman.spawn_points = spawn_points  # ← ADD THIS LINE
	
	weeping_angel.active = true
	slenderman.active = true
	print("Enemies activated!")
	
	# Connect activation zone
	activation_zone.area_entered.connect(_on_activation_zone_entered)
	
	# Wait before activation
	await get_tree().create_timer(0.5).timeout
	can_activate = true
	print("Enemies can now activate!")

func _on_activation_zone_entered(area: Area2D) -> void:
	if can_activate:
		if not weeping_angel.active:
			weeping_angel.active = true
			print("Weeping Angel ACTIVATED!")
		if not slenderman.active:
			slenderman.active = true
			print("Slenderman ACTIVATED!")
