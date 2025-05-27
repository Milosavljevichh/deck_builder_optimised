extends Node2D
class_name Entity_component

@export var health_component : Health_component
@export var deck : Deck
@onready var hand_component : Hand_component = $Hand_component

signal End_turn

#func start_turn(amount):

func draw_card(amount: int):
	if amount:
		if hand_component.card_display.get_children().size() < 6:
			for i in range(0, amount):
				var enemy
				var match_manager : Match_manager = get_parent()
				if name == "Player":
					enemy = match_manager.enemy
				else:
					enemy = match_manager.player
				hand_component.add_to_hand(deck.draw_from_deck(self, enemy))
	else:
		push_error("No draw ammount specified")

func end_turn():
	End_turn.emit()

#func get_entities():
	#var match_parent : Match_manager = get_parent()
	#return {
		#"player": match_parent.player,
		#"enemy": match_parent.enemy
	#}
