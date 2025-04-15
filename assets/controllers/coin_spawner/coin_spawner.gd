extends Node2D


const COIN = preload("res://assets/objects/coin/coin.tscn")


var _spawnpoints: Array[Node2D] = []


func _ready() -> void:
	for child in get_children():
		if child is Node2D:
			_spawnpoints.append(child)


func _on_timer_timeout() -> void:
	var index: int = randi_range(0, _spawnpoints.size() - 1)
	var coin: Node2D = COIN.instantiate() as Node2D
	add_child(coin)
	coin.global_position = _spawnpoints[index].global_position
