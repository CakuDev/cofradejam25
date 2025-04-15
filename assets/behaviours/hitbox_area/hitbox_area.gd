extends Area2D
class_name HitboxArea


signal on_damage_dealt(damage: int)
signal on_knockback_hit(knockback_force: float)


func hit(damage: int, knockback_force: float) -> void:
	on_damage_dealt.emit(damage)
	on_knockback_hit.emit(knockback_force)
