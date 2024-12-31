extends Node2D

var player : Node2D

func _ready():
	player = Node2D.new()
	add_child(player)

	# Check if a scion was selected
	if Global.selected_scion:
		initialize_player(Global.selected_scion)
	else:
		print("Error: No scion selected.")

	# Connect the move signal from controls.gd
	var controls = get_node("/root/ERRATAzero/Controls")
	if controls:
		controls.connect("move", Callable(self, "_on_move"))
	else:
		print("Error: Controls node not found.")

func initialize_player(scion):
	# Initialize the player with the selected scion's data
	player.name = scion["name"]
	var label = Label.new()
	label.text = scion["symbol"]
	player.add_child(label)
	player.position = Vector2(100, 100)  # Place the player at a default position
	print("Player initialized with scion: %s" % player.name)

func _on_move(direction: Vector2):
	if player:
		player.position += direction * 10  # Adjust the multiplier as needed
