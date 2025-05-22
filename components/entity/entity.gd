extends Node2D
class_name Entity_component

@export var health_component : Health_component
@export var deck : Deck
@onready var hand_component : Hand_component = $Hand_component
var first_turn = true

signal End_turn

func start_turn(amount):
	print('started')
	if first_turn:
		draw_card(5)
		first_turn = false
		return
	if amount:
		draw_card(amount)
	else:
		draw_card(1)

func draw_card(amount: int):
	if hand_component.cards_in_hand.size() < 6:
		for i in range(0, amount):
			hand_component.add_to_hand(deck.draw_from_deck())

func end_turn():
	End_turn.emit()
