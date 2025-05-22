extends Area2D
class_name Play_area_component

func _on_area_entered(area):
	if area is Draggable_component:
		area.is_playable = true


func _on_area_exited(area):
	if area is Draggable_component:
		area.is_playable = false
