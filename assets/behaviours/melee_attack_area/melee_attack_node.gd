extends Area2D


@onready var timer: Timer = $Timer


@export var damage_dealt: int = 1
@export var knockback_force: float = 1.


var _objectives: Array[HitboxArea] = []
var _can_attack: bool = true


func _on_area_entered(area: Area2D) -> void:
	if area is HitboxArea:
		_objectives.append(area)
		attack()


func _on_area_exited(area: Area2D) -> void:
	if area is HitboxArea:
		var index: int = _objectives.find(area)
		if index >= 0:
			_objectives.remove_at(index)


func attack():
	if not _objectives.is_empty() and _can_attack:
		print("ATTACKING")
		_objectives[0].hit(damage_dealt, knockback_force)
		timer.start()
		_can_attack = false


func _on_timer_timeout() -> void:
	_can_attack = true
	attack()
