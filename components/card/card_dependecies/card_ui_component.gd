extends Control
class_name Card_ui

var lift_up = false
#ovde ce se iz resursa ucitavati visual podaci
func set_up_ui(data: CardData):
	pass

func set_lift(is_hovered:bool):
	lift_up = is_hovered

func _process(delta):
	if lift_up:
		position.y = lerp(position.y, -50.0, 7 * delta)
	else:
		position.y = lerp(position.y, 0.0, 10 * delta)
