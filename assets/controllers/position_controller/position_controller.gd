extends Node
class_name PositionController


@export var left_player: Player
@export var right_player: Player


@onready var _timer: Timer = %Timer
@onready var charge_attack_audio: AudioStreamPlayer = $ChargeAttackAudio
@onready var attack_audio: AudioStreamPlayer = $AttackAudio


func _process(_delta: float) -> void:
	if left_player == null or right_player == null:
		return
		
	var left_to_right = right_player.global_position - left_player.global_position
	right_player.gpu_particles_2d.global_rotation = Vector2.LEFT.angle_to(left_to_right)
	left_player.gpu_particles_2d.global_rotation = Vector2.RIGHT.angle_to(left_to_right)
	
	if left_player.global_position.y - right_player.global_position.y > 5:
		if _timer.is_stopped() and not attack_audio.playing:
			_start_timer()
			create_tween().tween_property(right_player.gpu_particles_2d, "modulate", Color("ff4124"), .15)
			create_tween().tween_property(left_player.gpu_particles_2d, "modulate", Color("ff4124"), .15)
			charge_attack_audio.play()
	else:
		_stop_timer()
		create_tween().tween_property(right_player.gpu_particles_2d, "modulate", Color("89ccdd"), .15)
		create_tween().tween_property(left_player.gpu_particles_2d, "modulate", Color("89ccdd"), .15)
		charge_attack_audio.stop()

func _start_timer() -> void:
	_timer.start()
	

func _stop_timer() -> void:
	_timer.stop()


func _on_timer_timeout() -> void:
	if left_player == null or right_player == null:
		return
		
	left_player.hit(1)
	right_player.hit(1)
	attack_audio.play()
