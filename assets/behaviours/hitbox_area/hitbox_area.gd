extends Area2D
class_name HitboxArea


signal on_damage_dealt(damage: int)
signal on_knockback_hit(knockback_force: float, direction: Vector2)


func hit(damage: int, knockback_force: float, knockback_direction: Vector2) -> void:
	on_damage_dealt.emit(damage)
	on_knockback_hit.emit(knockback_force, knockback_direction)
