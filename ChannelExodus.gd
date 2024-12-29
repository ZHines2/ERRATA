extends Node

const SCREEN_WIDTH: int = 80
const SCREEN_HEIGHT: int = 15
var Scions = load("res://SCIONS.gd").new()

# Initialize scion positions and movements
var scion_positions = {}
var scion_directions = {}

func _ready():
	init_scion_movements()

func init_scion_movements():
	for scion in Scions.scions:
		var pos = Vector2(randi() % (SCREEN_WIDTH - 2), randi() % (SCREEN_HEIGHT - 2))
		var dir = Vector2((randi() % 3) - 1, (randi() % 3) - 1)
		scion_positions[scion["name"]] = pos
		scion_directions[scion["name"]] = dir

func update_scion_positions():
	for scion in Scions.scions:
		var pos = scion_positions[scion["name"]]
		var dir = scion_directions[scion["name"]]

		# Update position based on direction
		pos += dir

		# Randomly change direction
		if randi() % 10 < 3:
			dir = Vector2((randi() % 3) - 1, (randi() % 3) - 1)

		# Ensure position stays within bounds
		pos.x = clamp(pos.x, 0, SCREEN_WIDTH - 3)
		pos.y = clamp(pos.y, 0, SCREEN_HEIGHT - 3)

		scion_positions[scion["name"]] = pos
		scion_directions[scion["name"]] = dir

func render_exodus_level(width: int, height: int) -> String:
	update_scion_positions()

	var output = "╔" + "═".repeat(width - 2) + "╗\n"
	for y in range(height - 2):
		var line_output = " ".repeat(width - 2)
		for scion in Scions.scions:
			var pos = scion_positions[scion["name"]]
			if int(pos.y) == y:
				var x = int(pos.x)
				line_output = line_output.substr(0, x) + scion["symbol"] + line_output.substr(x + 1)
		output += "║" + line_output + "║\n"
	output += "╚" + "═".repeat(width - 2) + "╝\n"
	return output
