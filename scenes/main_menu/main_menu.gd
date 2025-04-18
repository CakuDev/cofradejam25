extends Control

const GAMEPLAY = preload("res://scenes/gameplay/gameplay.tscn")
@onready var options_menu: Control = %OptionsMenu


func _ready() -> void:
	get_tree().paused = false


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause") and options_menu.visible:
		options_menu.visible = false


func _on_play_button_pressed() -> void:
	SceneController.change_to_gameplay()


func _on_options_button_pressed() -> void:
	options_menu.visible = true
