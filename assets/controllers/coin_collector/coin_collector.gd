extends Node2D
class_name CoinCollector


@onready var label: Label = $Label


var coins: int = 0


func on_coin_collected() -> void:
	coins += 1
	label.text = "%02d" % coins
	if coins >= 20:
		SceneController.change_to_win_menu()
