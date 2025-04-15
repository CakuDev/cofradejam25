extends Area2D


@onready var timer: Timer = $Timer


var _objectives: Array[HealthNode] = []
var _can_attack: bool = true

func _on_body_entered(body: Node2D) -> void:
	var health_node: HealthNode = body.get_node_or_null("HealthNode") as HealthNode
	if health_node != null:
		print(body.name + " has entered... ")
		_objectives.append(health_node)
		attack()


func _on_body_exited(body: Node2D) -> void:
	var health_node: HealthNode = body.get_node_or_null("HealthNode") as HealthNode
	if health_node != null:
		var index: int = _objectives.find(health_node)
		if index > 0:
			print(body.name + " has exited... ")
			_objectives.remove_at(index)


func attack():
	if not _objectives.is_empty() and _can_attack:
		print("ATTACKING")
		_objectives[0].on_hit(1)
		timer.start()
		_can_attack = false


func _on_timer_timeout() -> void:
	_can_attack = true
	attack()
