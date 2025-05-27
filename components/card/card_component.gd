extends Control
class_name Card_component

@export var draggable_component : Draggable_component
@export var ui_component: Card_ui
var damage : int
var heal : int

var is_players_turn := false
var damage_target : Entity_component
var heal_target : Entity_component

func play():
#	postojace kartice koje i healuju i damage-uju
	if damage:
		damage_target.health_component.take_damage(damage)
	if heal:
		heal_target.health_component.heal(heal)

func discard():
	queue_free()

func _on_draggable_component_is_played():
	play()
	discard()
