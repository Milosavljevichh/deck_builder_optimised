extends Node2D

@export var player : Player
var enemy
var is_players_turn
var active_player

func _ready():
	is_players_turn = true
	player.End_turn.connect(end_round)
	start_round()

#igrac uvek igra prvi
func start_round():
	if is_players_turn:
		active_player = player
		player.start_turn(1)
	else:
		if enemy:
			active_player = enemy
			enemy.start_turn(1)
		else:
			push_error("No enemy selected for the match")

func end_round():
	is_players_turn = !is_players_turn
#	ukloniti mogucnost igranja trenutno aktivnom entititetu
#	play animaytions
	start_round()

func finish_match():
	pass
