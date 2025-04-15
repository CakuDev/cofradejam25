extends CharacterBody2D


const SPEED = 300.0


@export var input_prefix: String


var up_input: String
var left_input: String
var down_input: String
var right_input: String


func _ready() -> void:
	up_input = input_prefix + "_up"
	left_input = input_prefix + "_left"
	down_input = input_prefix + "_down"
	right_input = input_prefix + "_right"


func _physics_process(_delta: float) -> void:
	var x_direction := Input.get_axis(left_input, right_input)
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var y_direction := Input.get_axis(up_input, down_input)
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
