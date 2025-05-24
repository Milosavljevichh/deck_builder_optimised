extends Control
class_name Hand_component

@onready var card_display = $CanvasLayer/Hand/Cosmetic_wrapper/MarginContainer/ScrollContainer/card_display
@onready var hand = $CanvasLayer/Hand

const CARD_SCENE = preload("res://components/card/card_component.tscn")

var cards_in_hand : Array[Card_component] = []:
	get:
		return cards_in_hand

var card_in_hold : Card_component

func add_to_hand(data: CardData):
	var card = CARD_SCENE.instantiate()
	card.draggable_component.Is_selected.connect(hold_card)
	card.ui_component.set_up_ui(data)
	cards_in_hand.push_back(card)
	card_display.add_child(card)

func _on_proceed_pressed():
	get_parent().end_turn()

func hold_card(card: Card_component):
	card.draggable_component.Is_dropped.connect(drop_card)
	var children = card_display.get_children()
	var selected_card : Card_component = children[children.find(card)]
	selected_card.reparent(hand)

func drop_card(card: Card_component):
	var children = hand.get_children()
	var selected_card : Card_component = children[children.find(card)]
	selected_card.reparent(card_display)
