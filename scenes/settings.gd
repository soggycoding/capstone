extends Control
@onready var back_btn = $BackButton
@onready var audio_slider = $AudioSlider
@onready var brightness_slider = $BrightnessSlider
@onready var framerate_slider = $FramerateSlider
@onready var brightness_overlay = $BrightnessOverlay

func _ready() -> void:
	back_btn.pressed.connect(_on_back_btn_pressed)
# Connect sliders
	audio_slider.value_changed.connect(_on_audio_changed)
	brightness_slider.value_changed.connect(_on_brightness_changed)
	framerate_slider.value_changed.connect(_on_framerate_changed)

func _on_audio_changed(value: float) -> void:
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value / 100.0))
	print("Audio: ", value)

func _on_brightness_changed(value: float) -> void:
	# Adjust darkness overlay (higher value = darker)
	var darkness = 1.0 - (value / 100.0)  # Invert so 100 = brightest
	brightness_overlay.color = Color(0, 0, 0, darkness * 0.5)  # Black overlay
	print("Brightness: ", value)

func _on_framerate_changed(value: float) -> void:
	var fps = int(30 + (value / 100.0) * 90)
	Engine.max_fps = fps
	print("Framerate: ", fps)

func _on_back_btn_pressed() -> void:
	print("Back Button clicked")
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
