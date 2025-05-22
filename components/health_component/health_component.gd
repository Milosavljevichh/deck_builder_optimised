extends Node
class_name Health_component

signal has_died

@export var max_health : int

var current_health : int :
	get:
		return current_health
	set(new_health):
		if new_health > 0:
			current_health = new_health
		else:
			current_health = 0
			has_died.emit()

func _ready():
	current_health = max_health
