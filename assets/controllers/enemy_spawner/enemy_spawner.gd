extends Node2D


const BAT = preload("res://assets/characters/enemies/bat/bat.tscn")


@onready var timer: Timer = $Timer


@export var player: Player
@export var time_to_spawn: Vector2 = Vector2(4, 6)


var _spawnpoints: Array[Node2D] = []


func _ready() -> void:
	for child in get_children():
		if child is Node2D:
			_spawnpoints.append(child)
	timer.start(lerp(time_to_spawn.x, time_to_spawn.y, randf()))


func _on_timer_timeout() -> void:
	var index: int = randi_range(0, _spawnpoints.size() - 1)
	var bat: Bat = BAT.instantiate() as Bat
	add_child(bat)
	bat.global_position = _spawnpoints[index].global_position
	bat.set_player(player)
	timer.start(lerp(time_to_spawn.x, time_to_spawn.y, randf()))
