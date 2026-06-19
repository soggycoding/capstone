extends Node2D

@onready var level1_btn = $Level1Button
@onready var level2_btn = $Level2Button
@onready var level3_btn = $Level3Button
@onready var level4_btn = $Level4Button
@onready var level5_btn = $Level5Button
@onready var back_btn = $HUDLayer/BackButton

@export var unlocked_texture: Texture2D
@export var locked_texture: Texture2D

func _ready() -> void:
	level1_btn.pressed.connect(func(): load_level(1))
	level2_btn.pressed.connect(func(): load_level(2))
	level3_btn.pressed.connect(func(): load_level(3))
	level4_btn.pressed.connect(func(): load_level(4))
	level5_btn.pressed.connect(func(): load_level(5))
	back_btn.pressed.connect(func(): load_scene("res://scenes/main_menu.tscn"))
	
	level1_btn.texture_normal = unlocked_texture
	for btn in [level2_btn, level3_btn, level4_btn, level5_btn]:
		btn.texture_normal = locked_texture
		btn.disabled = true
		btn.modulate = Color(0.6, 0.6, 0.6)

func load_level(level_num: int) -> void:
	load_scene("res://Levels/Level%d.tscn" % level_num)

func load_scene(scene_path: String) -> void:
	$fade_transition.show()
	$fade_transition/fade_timer.start()
	$fade_transition/AnimationPlayer.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file(scene_path)
