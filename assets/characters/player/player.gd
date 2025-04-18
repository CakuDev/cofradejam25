extends CharacterBody2D
class_name Player


const SPEED = 100.0


@onready var health_node: HealthNode = $HealthNode
@onready var character_sprite: CharacterSprite = %CharacterSprite
@onready var hitbox_area: HitboxArea = $HitboxArea
@onready var gpu_particles_2d: CPUParticles2D = $GPUParticles2D


@export var input_prefix: String
@export var hp: HP


var _up_input: String
var _left_input: String
var _down_input: String
var _right_input: String


signal on_player_death


func _ready() -> void:
	_up_input = input_prefix + "_up"
	_left_input = input_prefix + "_left"
	_down_input = input_prefix + "_down"
	_right_input = input_prefix + "_right"
	if input_prefix == "rc":
		gpu_particles_2d.rotate(PI)
	health_node.on_hp_changed.connect(hp.on_hp_decreased)


func _physics_process(_delta: float) -> void:
	var x_direction := Input.get_axis(_left_input, _right_input)
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var y_direction := Input.get_axis(_up_input, _down_input)
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()


func hit(damage: int) -> void:
	hitbox_area.hit(damage, 0, Vector2.ZERO)


func on_death(hp: int) -> void:
	if hp <= 0:
		get_tree().paused = true
		on_player_death.emit()
