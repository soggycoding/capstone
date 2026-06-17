extends Node2D  # Change from Control to Node2D

@onready var back_btn = $HUDLayer/BackButton
@onready var level1_btn = $Level1Button
@onready var level2_btn = $Level2Button
@onready var level3_btn = $Level3Button
@onready var level4_btn = $Level4Button
@onready var level5_btn = $Level5Button


@export var unlocked_texture: Texture2D
@export var locked_texture: Texture2D

func _ready() -> void:
	level1_btn.pressed.connect(func(): load_level(1))
	level2_btn.pressed.connect(func(): level_check())
	level3_btn.pressed.connect(func(): level_check())
	level4_btn.pressed.connect(func(): level_check())
	level5_btn.pressed.connect(func(): level_check())
	back_btn.pressed.connect(func(): load_scene("res://Levels/Lobby/lobby_settings.tscn"))
	
	
func level_check() -> void:
	if level2_btn.texture_normal:
		print("Area is still locked")
	elif level3_btn.texture_normal:
		print("Area is still locked")
	elif level4_btn.texture_normal:
		print("Area is still locked")
	elif level5_btn.texture_normal:
		print("Area is still locked")
	
	

func load_level(level_num: int) -> void:
	load_scene("res://Levels/level_%d.tscn" % level_num)

func load_scene(scene_path: String) -> void:
	$fade_transition.show()
	$fade_transition/fade_timer.start()
	$fade_transition/AnimationPlayer.play("fade_in")
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file(scene_path)
