extends Node
class_name Health_component

signal Has_died

@export var max_health : int

var current_health : int :
	get:
		return current_health
	set(new_health):
		if new_health > 0:
			current_health = new_health
		else:
			current_health = 0
			Has_died.emit()

func _ready():
	current_health = max_health

func heal(amount:int):
	if current_health > 100:
		current_health += amount
	if current_health > 100:
		current_health = 100

func take_damage(amount:int):
	current_health -= amount
