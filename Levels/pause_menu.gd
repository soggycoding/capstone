extends Control

@onready var resume_btn = $ResumeButton
@onready var exit_btn = $ExitButton
@onready var sound_slider = $SoundSlider
@onready var brightness_slider = $BrightnessSlider

func _ready() -> void:
	
	resume_btn.process_mode = Node.PROCESS_MODE_ALWAYS
	exit_btn.process_mode = Node.PROCESS_MODE_ALWAYS
	sound_slider.process_mode = Node.PROCESS_MODE_ALWAYS
	brightness_slider.process_mode = Node.PROCESS_MODE_ALWAYS
	
	resume_btn.pressed.connect(_on_resume_pressed)
	exit_btn.pressed.connect(_on_exit_pressed)
	sound_slider.value_changed.connect(_on_sound_changed)
	brightness_slider.value_changed.connect(_on_brightness_changed)

func _on_resume_pressed() -> void:
	get_tree().paused = false
	visible = false

func _on_exit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_sound_changed(value: float) -> void:
	var audio_bus = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(audio_bus, linear_to_db(value / 100.0))

func _on_brightness_changed(value: float) -> void:
	get_tree().root.modulate = Color(1, 1, 1, 1) * (value / 100.0 + 0.5)
