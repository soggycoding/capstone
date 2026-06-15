extends Control

@onready var new_game_btn = $NewGameButton
@onready var continue_btn = $ContinueButton
@onready var settings_btn = $SettingsButton
@onready var exit_btn = $ExitButton
@onready var base_background = $TextureRect
@onready var ui_overlay = $UIOverlay
@onready var menu_animator = $MenuAnimationPlayer

# Button UI images
@export var menu_image_1 = preload("res://scenes/menus/menu_buttons/Main Menu1.png")
@export var menu_image_2 = preload("res://scenes/menus/menu_buttons/Main Menu2.png")
@export var menu_image_3 = preload("res://scenes/menus/menu_buttons/Main Menu3.png")
@export var menu_image_4 = preload("res://scenes/menus/menu_buttons/Main Menu4.png")



func _ready() -> void:
	var empty_theme = Theme.new()
	
	for btn in [new_game_btn, continue_btn, settings_btn, exit_btn]:
		btn.theme = empty_theme
	
	menu_animator.play("grass_animation")
	
	# Keyboard focus events
	new_game_btn.focus_entered.connect(func(): highlight_button(new_game_btn, menu_image_1))
	continue_btn.focus_entered.connect(func(): highlight_button(continue_btn, menu_image_2))
	settings_btn.focus_entered.connect(func(): highlight_button(settings_btn, menu_image_3))
	exit_btn.focus_entered.connect(func(): highlight_button(exit_btn, menu_image_4))
	
	# MOUSE hover events
	new_game_btn.mouse_entered.connect(func(): highlight_button(new_game_btn, menu_image_1))
	new_game_btn.mouse_exited.connect(func(): unhighlight_button(new_game_btn))
	
	continue_btn.mouse_entered.connect(func(): highlight_button(continue_btn, menu_image_2))
	continue_btn.mouse_exited.connect(func(): unhighlight_button(continue_btn))
	
	settings_btn.mouse_entered.connect(func(): highlight_button(settings_btn, menu_image_3))
	settings_btn.mouse_exited.connect(func(): unhighlight_button(settings_btn))
	
	exit_btn.mouse_entered.connect(func(): highlight_button(exit_btn, menu_image_4))
	exit_btn.mouse_exited.connect(func(): unhighlight_button(exit_btn))
	
	# Button press events
	new_game_btn.pressed.connect(_on_new_game_pressed)
	continue_btn.pressed.connect(_on_continue_pressed)
	settings_btn.pressed.connect(_on_settings_pressed)
	exit_btn.pressed.connect(_on_exit_pressed)
	
	dim_all_buttons()
	new_game_btn.grab_focus()

func highlight_button(button: Button, image: Texture2D) -> void:
	dim_all_buttons()
	ui_overlay.texture = image
	
	# Animate button color to white
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(button, "modulate", Color.WHITE, 0.2)

func unhighlight_button(button: Button) -> void:
	# Animate button color back to gray
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(button, "modulate", Color(0.5, 0.5, 0.5), 0.2)

func dim_all_buttons() -> void:
	new_game_btn.modulate = Color(0.5, 0.5, 0.5)
	continue_btn.modulate = Color(0.5, 0.5, 0.5)
	settings_btn.modulate = Color(0.5, 0.5, 0.5)
	exit_btn.modulate = Color(0.5, 0.5, 0.5)

func _on_new_game_pressed() -> void:
	print("New Game clicked")
	$fade_transition.show()
	$fade_transition/fade_timer.start()  # This timer triggers the scene change
	$fade_transition/AnimationPlayer.play("fade_in")

func _on_continue_pressed() -> void:
	print("Continue clicked")
	$fade_transition.show()
	$fade_transition/fade_timer.start()
	$fade_transition/AnimationPlayer.play("fade_in")

func _on_settings_pressed() -> void:
	print("Settings clicked")
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_fade_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Levels/game_level.tscn")
