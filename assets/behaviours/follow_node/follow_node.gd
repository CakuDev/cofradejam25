extends Node
class_name FollowPlayerNode


@export var speed: float = 50
var node_to_follow: Node2D


var _parent: CharacterBody2D
var _can_move: bool = true


func _ready() -> void:
	_parent = get_parent() as CharacterBody2D


func _physics_process(_delta: float) -> void:
	if node_to_follow == null or not _can_move:
		return
		
	var direction: Vector2 =  (node_to_follow.global_position - _parent.global_position).normalized()
	_parent.velocity = direction * speed
	_parent.move_and_slide()


func update_node_to_follow(new_node: Node2D) -> void:
	node_to_follow = new_node


func enable_movement() -> void:
	_can_move = true
	
	
func disable_movement() -> void:
	_can_move = false
