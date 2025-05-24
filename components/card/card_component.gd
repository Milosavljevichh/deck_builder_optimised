extends Control
class_name Card_component

@export var draggable_component : Draggable_component
@export var ui_component: Card_ui
@export var damage : int
@export var heal : int

var damage_target : Basic_enemy
var heal_target : Player

func play():
#	postojace kartice koje i healuju i damage-uju
	if damage:
		damage_target.health_component.take_damage(damage)
	if heal:
		heal_target.health_component.heal(heal)
	

func discard():
	return

func _on_draggable_component_is_played():
	#play()
	queue_free()
