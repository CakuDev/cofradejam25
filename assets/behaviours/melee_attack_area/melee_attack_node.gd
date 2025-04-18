extends Area2D


const ATTACK_SWEEP = preload("res://assets/objects/attack_sweep/attack_sweep.tscn")


@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


@export var damage_dealt: int = 1
@export var knockback_force: float = 1.
@export var attack_sfx: AudioStream


var _objectives: Array[HitboxArea] = []
var _can_attack: bool = true


func _ready() -> void:
	audio_stream_player.stream = attack_sfx


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
		var objective: HitboxArea = _objectives[0]
		var knockback_direction: Vector2 = (objective.global_position - global_position).normalized()
		objective.hit(damage_dealt, knockback_force, knockback_direction)
		var attack_sweep: Node2D = ATTACK_SWEEP.instantiate() as Node2D
		add_sibling(attack_sweep)
		attack_sweep.global_position = objective.global_position
		attack_sweep.global_rotation = Vector2.UP.angle_to(knockback_direction)
		timer.start()
		_can_attack = false
		audio_stream_player.play()


func _on_timer_timeout() -> void:
	_can_attack = true
	attack()
