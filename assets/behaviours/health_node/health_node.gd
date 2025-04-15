extends Node
class_name HealthNode


@export var health: int


var _current_health: int


func _ready() -> void:
	_current_health = health


func on_hit(damage: int):
	_current_health -= damage
	print(get_parent().name + " HIT: " + str(_current_health))
	if _current_health <= 0:
		get_parent().queue_free()
		
		
func on_healed(heal: int):
	_current_health += heal
	if _current_health > health:
		_current_health = health
