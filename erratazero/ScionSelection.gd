# ScionSelection.gd
extends Node

var scions = load("res://SCIONS.gd").scions
var selected_scion = null

func _ready():
	display_scion_symbols()

func display_scion_symbols():
	for scion in scions:
		print("%s: %s" % [scion["name"], scion["symbol"]])

func _input(event):
	if event is InputEventKey:
		match event.scancode:
			KEY_1:
				selected_scion = scions[0]
			KEY_2:
				selected_scion = scions[1]
			# Add more keys for additional scions as needed

		if selected_scion:
			print("Selected Scion: %s" % selected_scion["name"])
			get_tree().change_scene("res://dungeon.gd")  # Transition to dungeon scene
