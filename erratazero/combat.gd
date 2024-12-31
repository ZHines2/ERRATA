# combat.gd
extends Node

var player_scion = null
var enemy_scion = null

func start_combat(player, enemy):
	player_scion = player
	enemy_scion = enemy
	battle()

func battle():
	while true:
		if player_turn():
			print("%s wins!" % player_scion["name"])
			break
		if enemy_turn():
			print("%s wins!" % enemy_scion["name"])
			break

func player_turn():
	var attack_value = player_scion["stats"]["power"]
	enemy_scion["stats"]["power"] -= attack_value
	print("%s attacks! Enemy power: %d" % [player_scion["name"], enemy_scion["stats"]["power"]])
	return enemy_scion["stats"]["power"] <= 0

func enemy_turn():
	var attack_value = enemy_scion["stats"]["power"]
	player_scion["stats"]["power"] -= attack_value
	print("%s attacks! Player power: %d" % [enemy_scion["name"], player_scion["stats"]["power"]])
	return player_scion["stats"]["power"] <= 0
