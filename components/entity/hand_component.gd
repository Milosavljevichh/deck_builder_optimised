extends Control
class_name Hand_component

@onready var card_display = $CanvasLayer/Hand/Cosmetic_wrapper/MarginContainer/ScrollContainer/card_display
@onready var hand = $CanvasLayer/Hand

const CARD_SCENE = preload("res://components/card/card_component.tscn")

var cards_in_hand : Array[Node] = []:
	get:
		return cards_in_hand

var card_in_hold : Card_component
var hand_occupied = false

func add_to_hand(data: CardData):
	var card = CARD_SCENE.instantiate()
	card.draggable_component.Is_selected.connect(hold_card)
	card.ui_component.set_up_ui(data)
	card_display.add_child(card)
	cards_in_hand = card_display.get_children()

func _on_proceed_pressed():
	get_parent().end_turn()

func hold_card(card: Card_component):
	if !hand_occupied:
		card.draggable_component.is_dragging = true
		card.draggable_component.Is_dropped.connect(drop_card)
		var children = card_display.get_children()
		var selected_card : Card_component = children[children.find(card)]
		selected_card.reparent(hand)
		hand_occupied = true

func drop_card(card: Card_component):
	card.draggable_component.is_dragging = false
	hand_occupied = false
	var children = hand.get_children()
	var selected_card : Card_component = children[children.find(card)]
	selected_card.reparent(card_display)
