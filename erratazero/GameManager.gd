# game_manager.gd
extends Node

func _ready():
	var scion_selection = get_node("../ScionSelection")
	scion_selection.display_scion_symbols()
	get_tree().change_scene("res://scion_selection.tscn")
