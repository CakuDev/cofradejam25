extends CharacterBody2D
class_name Bat


signal on_player_set(player: Node2D)


var _player: Player


func set_player(player: Player) -> void:
	_player = player
	on_player_set.emit(_player)
