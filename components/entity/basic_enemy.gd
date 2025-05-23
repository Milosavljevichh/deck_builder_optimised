extends Entity_component
class_name Basic_enemy

func draw_card(amount):
#	for early prototype, enemy will draw a random card and play it
	var card_to_play : Card_component
	card_to_play = hand_component.cards_in_hand.pick_random()
	if card_to_play:
		card_to_play.play()
	End_turn.emit()
	print("enemy played")
