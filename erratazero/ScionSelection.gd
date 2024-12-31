extends Node2D

var scions_script = load("res://SCIONS.gd").new()
var scions = []
var current_index = 0  # Index to keep track of the selected scion

func _ready():
	scions = scions_script.get("scions")
	display_scion_symbols()
	update_selection()  # Highlight the initial selection

	# Connect the move signal from controls.gd
	var controls = get_node("/root/ERRATAzero/Controls")
	if controls:
		controls.connect("move", Callable(self, "_on_move"))
	else:
		print("Error: Controls node not found.")

func display_scion_symbols():
	var y_offset = 0
	for scion in scions:
		var label = Label.new()
		label.text = "%s: %s" % [scion["name"], scion["symbol"]]
		label.position = Vector2(10, 10 + y_offset)
		add_child(label)
		y_offset += 20

func _on_move(direction: Vector2):
	if direction == Vector2(0, -1):  # Up
		current_index = max(current_index - 1, 0)
	elif direction == Vector2(0, 1):  # Down
		current_index = min(current_index + 1, scions.size() - 1)
	update_selection()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		Global.selected_scion = scions[current_index]
		print("Selected Scion: %s" % Global.selected_scion["name"])
		get_tree().change_scene_to_file("res://erratazero/DungeonGeneration.tscn")

func update_selection():
	# Clear existing highlights
	for node in get_children():
		if node is Label:
			node.modulate = Color(1, 1, 1)  # Reset color to white
	# Highlight the currently selected scion
	var label = get_child(current_index)
	if label is Label:
		label.modulate = Color(1, 1, 0)  # Highlight color (yellow)
