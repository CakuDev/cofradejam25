extends Node


var MAIN_MENU = load("res://scenes/main_menu/main_menu.tscn")
var GAMEPLAY = load("res://scenes/gameplay/gameplay.tscn")
const WIN_MENU = preload("res://scenes/win_menu/win_menu.tscn")


var _current_scene: Node


func _ready() -> void: 
	_current_scene = get_tree().root.get_node("MainMenu")
	await self.ready


func change_to_gameplay() -> void:
	var new_scene: Node = GAMEPLAY.instantiate()
	get_tree().root.add_child(new_scene)
	get_tree().root.remove_child(_current_scene)
	_current_scene = new_scene
	
	
func change_to_main_menu() -> void:
	var new_scene: Node = MAIN_MENU.instantiate()
	get_tree().root.add_child(new_scene)
	get_tree().root.remove_child(_current_scene)
	_current_scene = new_scene


func change_to_win_menu() -> void:
	var new_scene: Node = WIN_MENU.instantiate()
	get_tree().root.add_child(new_scene)
	get_tree().root.call_deferred("remove_child", _current_scene)
	_current_scene = new_scene
