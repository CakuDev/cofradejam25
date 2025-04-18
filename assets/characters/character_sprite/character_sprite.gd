extends Sprite2D
class_name CharacterSprite


func on_damage_dealt(_damage: int) -> void:
	var tween: Tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "modulate", Color("ff6666"), .2)
	tween.tween_property(self, "modulate", Color("ffffff"), .2)
