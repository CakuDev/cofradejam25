extends Node2D


const BAT = preload("res://assets/characters/enemies/bat/bat.tscn")


@export var player: Player


var _spawnpoints: Array[Node2D] = []


func _ready() -> void:
	for child in get_children():
		if child is Node2D:
			_spawnpoints.append(child)


func _on_timer_timeout() -> void:
	var index: int = randi_range(0, _spawnpoints.size() - 1)
	var bat: Bat = BAT.instantiate() as Bat
	add_child(bat)
	bat.global_position = _spawnpoints[index].global_position
	bat.set_player(player)
	
