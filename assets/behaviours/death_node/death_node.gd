extends Node2D


func on_death() -> void:
	get_parent().queue_free()
