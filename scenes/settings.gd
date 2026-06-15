extends Control
@onready var back_btn = $BackButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back_btn.pressed.connect(_on_back_btn_pressed)

func _on_back_btn_pressed() -> void:
	print("Back Button clicked")
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
