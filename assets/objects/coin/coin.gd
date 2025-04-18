extends Area2D
class_name Coin


@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


signal on_coin_collected


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		sprite_2d.queue_free()
		collision_shape_2d.set_deferred("disabled", true)
		on_coin_collected.emit()
		audio_stream_player.play()
		await audio_stream_player.finished
		queue_free()
