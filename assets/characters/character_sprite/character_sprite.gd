extends Sprite2D
class_name CharacterSprite


var is_moving: bool = true:
	get:
		return is_moving
	set(value):
		if is_moving == value:
			return
		is_moving = value
		if is_moving:
			rotation()


func on_damage_dealt(_damage: int) -> void:
	var tween: Tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "modulate", Color("ff6666"), .2)
	tween.tween_property(self, "modulate", Color("ffffff"), .2)
	
	
func _ready() -> void:
	rotation()


func rotation() -> void:
	await create_tween().tween_property(self,"global_rotation_degrees", -10, .3).finished
	if not is_moving:
		await create_tween().tween_property(self,"global_rotation_degrees", 0, .3).finished
		return
	await create_tween().tween_property(self,"global_rotation_degrees", 10, .3).finished
	if not is_moving:
		await create_tween().tween_property(self,"global_rotation_degrees", 0, .3).finished
		return
	rotation()
