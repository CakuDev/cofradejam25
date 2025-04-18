extends Node2D


const COIN = preload("res://assets/objects/coin/coin.tscn")


@export var left_player: Player
@export var right_player: Player
@export var coin_collector: CoinCollector

var _spawnpoints: Array[Node2D] = []
var current_points: int = 0


func _ready() -> void:
	for child in get_children():
		if child is Node2D:
			_spawnpoints.append(child)


func _on_timer_timeout() -> void:
	var spawn_position: Vector2 = left_player.global_position
	while(spawn_position.distance_to(left_player.global_position) < 5 or spawn_position.distance_to(right_player.global_position) < 5):
		var index: int = randi_range(0, _spawnpoints.size() - 1)
		spawn_position = _spawnpoints[index].global_position
	var coin: Coin = COIN.instantiate() as Coin
	coin.on_coin_collected.connect(coin_collector.on_coin_collected)
	add_child(coin)
	coin.global_position = spawn_position


func on_coin_collected() -> void:
	current_points += 1
	print(current_points)
