extends Area2D
class_name Draggable_component

var is_hovered:bool = false
var is_dragging:bool = false
var is_playable:bool = false
var last_position
@export var card : Card_component
@export var drag_speed := 9

func _physics_process(delta):
	if is_dragging:
		card.global_position = lerp(card.global_position, get_global_mouse_position() - Vector2(0, 0), drag_speed * delta)

func _input(event):
	if is_hovered:
		if Input.is_action_just_pressed("normal_click"):
			last_position = card.global_position
		if Input.is_action_pressed("normal_click"):
			is_dragging = true
	if Input.is_action_just_released("normal_click"):
		if is_dragging:
			drop_card()

func drop_card():
	is_dragging = false
	if is_playable:
		card.play()
#		TODO: make logic for transfering the card into the 'discarded' pile
		card.visible = false
	else:
		card.global_position = last_position
		last_position = card.global_position

func _on_mouse_entered():
	is_hovered = true

func _on_mouse_exited():
	is_hovered = false
