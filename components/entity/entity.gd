extends Node2D
class_name Entity_component

@export var health_component : Health_component
@export var deck : Deck
@onready var hand_component : Hand_component = $Hand_component

signal End_turn

#func start_turn(amount):

func draw_card(amount: int):
	if amount:
		if hand_component.cards_in_hand.size() < 6:
			for i in range(0, amount):
				hand_component.add_to_hand(deck.draw_from_deck())
	else:
		push_error("No draw ammount specified")

func end_turn():
	End_turn.emit()
