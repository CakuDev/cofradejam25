extends Node
class_name PositionController


@export var left_player: Player
@export var right_player: Player


@onready var _timer: Timer = %Timer


func _process(_delta: float) -> void:
	if left_player == null or right_player == null:
		return
		
	if left_player.global_position.y > right_player.global_position.y:
		if _timer.is_stopped():
			_start_timer()
	elif not _timer.is_stopped():
		_stop_timer()


func _start_timer() -> void:
	_timer.start()
	

func _stop_timer() -> void:
	_timer.stop()


func _on_timer_timeout() -> void:
	if left_player == null or right_player == null:
		return
		
	left_player.hit(1)
	right_player.hit(1)
