extends Node


signal on_knockback_started()
signal on_knockback_ended()


func start_knockback(force: float, direction: Vector2) -> void:
	on_knockback_started.emit()
	var parent: Node2D = get_parent() as Node2D
	var final_position: Vector2 = parent.global_position + direction * force
	var tween: Tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	await tween.tween_property(get_parent(), "global_position", final_position, .2).finished
	on_knockback_ended.emit()
	
