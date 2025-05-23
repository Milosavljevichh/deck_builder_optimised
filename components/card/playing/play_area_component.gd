extends Area2D
class_name Play_area_component

@onready var field = $field

var active = false

func switch_active(is_active : bool):
	active = is_active
	if !active:
		field.modulate = Color.RED
	else:
		field.modulate = Color.WHITE

func _on_area_entered(area:Draggable_component):
	if active:
		if area is Draggable_component:
			area.is_playable = true

func _on_area_exited(area):
	if active:
		if area is Draggable_component:
			area.is_playable = false
