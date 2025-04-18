extends Node2D
class_name HP

const EMPTY_HEART = preload("res://assets/ui/hp/empty_heart.png")


@onready var full_heart_5: Sprite2D = $FullHeart5
@onready var full_heart_4: Sprite2D = $FullHeart4
@onready var full_heart_3: Sprite2D = $FullHeart3
@onready var full_heart_2: Sprite2D = $FullHeart2
@onready var full_heart_1: Sprite2D = $FullHeart1


var hp_cointainers: Array[Sprite2D]


func _ready() -> void:
	hp_cointainers.append(full_heart_1)
	hp_cointainers.append(full_heart_2)
	hp_cointainers.append(full_heart_3)
	hp_cointainers.append(full_heart_4)
	hp_cointainers.append(full_heart_5)
	

func on_hp_decreased(new_hp: int) -> void:
	hp_cointainers[new_hp].texture = EMPTY_HEART
