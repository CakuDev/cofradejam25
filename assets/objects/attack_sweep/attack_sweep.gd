extends Sprite2D


func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	frame = 1
	await get_tree().create_timer(0.1).timeout
	frame = 2
	await get_tree().create_timer(0.1).timeout
	queue_free()
