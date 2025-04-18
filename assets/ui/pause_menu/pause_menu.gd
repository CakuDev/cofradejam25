extends Control


const MAIN_MENU = preload("res://scenes/main_menu/main_menu.tscn")


@onready var options_menu: Control = %OptionsMenu
@onready var game_over: Control = $"../GameOver"


var can_pause: bool = false


func _input(_event: InputEvent) -> void:
	if not can_pause:
		return
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			if options_menu.visible:
				options_menu.visible = false
			else:
				_on_continue_button_pressed()
		else:
			get_tree().paused = true
			visible = true


func _on_continue_button_pressed() -> void:
	get_tree().paused = false
	visible = false


func _on_options_button_pressed() -> void:
	options_menu.visible = true


func _on_exit_button_pressed() -> void:
	get_tree().paused = false
	SceneController.change_to_main_menu()


func disable_pause() -> void:
	can_pause = false
	game_over.visible = true
