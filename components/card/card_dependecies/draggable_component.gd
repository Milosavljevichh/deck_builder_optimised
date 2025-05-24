extends Area2D
class_name Draggable_component

signal Is_played
signal Is_selected(card:Card_component)
signal Is_dropped(card:Card_component)

@onready var collision_shape_2d = $CollisionShape2D
@onready var ui : Card_ui = get_parent().ui_component

var is_hovered:bool = false
var is_dragging:bool = false
var is_playable:bool = false

@export var card : Card_component
@export var drag_speed := 9

func _physics_process(delta):
	if is_dragging:
		card.global_position = lerp(
			card.global_position,
			get_global_mouse_position() - collision_shape_2d.shape.get_size()/2,
			drag_speed * delta
			)

func _input(event):
	if is_hovered:
		if Input.is_action_pressed("normal_click"):
			if !is_dragging:
				Is_selected.emit(get_parent())
				ui.set_lift(false)
	if Input.is_action_just_released("normal_click"):
		if is_dragging:
			if is_playable:
				Is_played.emit()
			Is_dropped.emit(get_parent())

func _on_mouse_entered():
	is_hovered = true
	ui.set_lift(true)

func _on_mouse_exited():
	is_hovered = false
	ui.set_lift(false)
