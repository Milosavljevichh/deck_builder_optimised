extends Node2D

#debugging
@onready var phase = $debugging/phase

@export var play_area : Play_area_component
@export var player : Player
var enemy
var is_players_turn

func _ready():
	is_players_turn = true
	for i in get_children():
		if i is Basic_enemy:
			enemy = i
			break
	player.End_turn.connect(end_round)
	player.health_component.Has_died.connect(finish_match)
	enemy.End_turn.connect(end_round)
	enemy.health_component.Has_died.connect(finish_match)
	start_round()

#igrac uvek igra prvi
func start_round():
	phase.text = "Is player playing: " + str(is_players_turn)
	if is_players_turn:
		player_turn()
	else:
		if enemy:
			enemy_turn()
		else:
			push_error("No enemy selected for the match")

func player_turn():
	play_area.switch_active(true)
	player.draw_card(1)

func enemy_turn():
	play_area.switch_active(false)
	enemy.draw_card(1)

func end_round():
	is_players_turn = !is_players_turn
#	ukloniti mogucnost igranja trenutno aktivnom entititetu
#	play animaytions
	start_round()

func finish_match():
#	funkcija za odvodjenje na match over screen
	get_tree().change_scene_to_file("res://scenes/screens/match_end_screen.tscn")
