extends Control
class_name Hand_component


var cards_in_hand : Array[Card_component] = []:
	get:
		return cards_in_hand

func add_to_hand(card: Card_component):
	cards_in_hand.push_back(card)
