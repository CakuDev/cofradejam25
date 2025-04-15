extends Node
class_name FollowPlayerNode


@export var speed: float = 50
var node_to_follow: Node2D


var _parent: CharacterBody2D


func _ready() -> void:
	_parent = get_parent() as CharacterBody2D
	node_to_follow = get_tree().root.get_node("Gameplay/LeftPlayer") as Node2D


func _physics_process(_delta: float) -> void:
	var direction: Vector2 =  (node_to_follow.global_position - _parent.global_position).normalized()
	_parent.velocity = direction * speed
	_parent.move_and_slide()
