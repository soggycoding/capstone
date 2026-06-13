extends Control

@onready var new_game_btn = $NewGameButton
@onready var continue_btn = $ContinueButton
@onready var settings_btn = $SettingsButton
@onready var exit_btn = $ExitButton
@onready var base_background = $TextureRect  # Animated grass
@onready var ui_overlay = $UIOverlay  # Button images
@onready var menu_animator = $MenuAnimationPlayer

# Button UI images
@export var menu_image_1 = preload("res://scenes/menus/menu_buttons/Main Menu1.png")
@export var menu_image_2 = preload("res://scenes/menus/menu_buttons/Main Menu2.png")
@export var menu_image_3 = preload("res://scenes/menus/menu_buttons/Main Menu3.png")
@export var menu_image_4 = preload("res://scenes/menus/menu_buttons/Main Menu4.png")

func _ready() -> void:
	# Play grass animation
	menu_animator.play("grass_animation")  # Loops continuously
	
	# Button connections
	new_game_btn.focus_entered.connect(func(): highlight_button(new_game_btn, menu_image_1))
	continue_btn.focus_entered.connect(func(): highlight_button(continue_btn, menu_image_2))
	settings_btn.focus_entered.connect(func(): highlight_button(settings_btn, menu_image_3))
	exit_btn.focus_entered.connect(func(): highlight_button(exit_btn, menu_image_4))
	
	new_game_btn.pressed.connect(_on_new_game_pressed)
	continue_btn.pressed.connect(_on_continue_pressed)
	settings_btn.pressed.connect(_on_settings_pressed)
	exit_btn.pressed.connect(_on_exit_pressed)
	
	dim_all_buttons()
	new_game_btn.grab_focus()

func highlight_button(button: Button, image: Texture2D) -> void:
	dim_all_buttons()
	button.modulate = Color.WHITE
	ui_overlay.texture = image  # Swap UI overlay image

func dim_all_buttons() -> void:
	new_game_btn.modulate = Color(0.5, 0.5, 0.5)
	continue_btn.modulate = Color(0.5, 0.5, 0.5)
	settings_btn.modulate = Color(0.5, 0.5, 0.5)
	exit_btn.modulate = Color(0.5, 0.5, 0.5)

func _on_new_game_pressed() -> void:
	print("New Game clicked")

func _on_continue_pressed() -> void:
	print("Continue clicked")

func _on_settings_pressed() -> void:
	print("Settings clicked")

func _on_exit_pressed() -> void:
	get_tree().quit()
