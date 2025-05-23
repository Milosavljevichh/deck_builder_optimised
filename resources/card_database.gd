extends Node

#pravimo dictionary da bi smo posle dodavali kartice u spil na osnovu njihovog imena
var all_cards: Dictionary = {}

func _ready():
#	napraviti da loopuje kroz folder i da ih tako doda
	#primer: all_cards["prototype_card"] = preload("res://scenes/cards/prototype_card.tres")
	all_cards["prototype_card"] = preload("res://resources/card_instances/prototype_card.tres")
