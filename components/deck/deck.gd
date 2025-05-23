extends Node2D
class_name Deck

var deck : Array[CardData] = []
#The deck is just an array of objects
#there should be a database containing all of the cards information
#there should be a database of cards that are in use
# when,for example,drawing a card from the deck a random card should be selected from 'in use' database
#that cards information should then be passed into the card scene which creates it

func _ready():
	var cards = CardDatabase.all_cards
	for card in cards:
		add_to_deck(cards[card])

func add_to_deck(card: CardData):
#	funkcija za dodavanje kartica u sam spil
	deck.push_back(card)

func draw_from_deck():
#	returnovace kartu
	return deck.pick_random()
