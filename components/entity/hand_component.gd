extends Control
class_name Hand_component

@onready var card_display = $CanvasLayer/Hand/Cosmetic_wrapper/MarginContainer/ScrollContainer/card_display

const CARD_SCENE = preload("res://components/card/card_component.tscn")

var cards_in_hand : Array[Card_component] = []:
	get:
		return cards_in_hand

func add_to_hand(data: CardData):
	var card = CARD_SCENE.instantiate()
	card.ui_component.set_up_ui(data)
	cards_in_hand.push_back(card)
	card_display.add_child(card)


func _on_proceed_pressed():
	get_parent().end_turn()
