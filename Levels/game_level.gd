extends Node2D

@onready var weeping_angel_scene = preload("res://Enemies/weeping_angel.tscn")
@onready var spawn_points = [
	$SpawnPoint1.global_position,
	$SpawnPoint2.global_position,
	$SpawnPoint3.global_position,
]
@onready var activation_zone = $ActivationZone
@onready var player = $CharacterBody2D

var weeping_angel: CharacterBody2D

func _ready() -> void:
	# Randomly spawn the angel
	var random_spawn = spawn_points[randi() % spawn_points.size()]
	weeping_angel = weeping_angel_scene.instantiate()
	add_child(weeping_angel)
	weeping_angel.global_position = random_spawn
	weeping_angel.active = false
	
	# Connect activation zone
	activation_zone.area_entered.connect(_on_activation_zone_entered)
	print("Activation zone ready at: ", activation_zone.global_position)

func _physics_process(delta: float) -> void:
	# Alternative: Check distance instead of area
	var distance = player.global_position.distance_to(weeping_angel.global_position)
	if distance < 400 and not weeping_angel.active:
		weeping_angel.active = true
		print("Weeping Angel ACTIVATED by distance!")

func _on_activation_zone_entered(area: Area2D) -> void:
	print("Area entered: ", area.name, " owner: ", area.owner)
	weeping_angel.active = true
	print("Weeping Angel ACTIVATED!")
