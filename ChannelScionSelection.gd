extends Node

# Load SCIONS.gd script
var Scions = load("res://SCIONS.gd").new()

func render_scion_selection(screen_width: int) -> String:
	var output: String = ""

	# Display turntable of scions
	var scion_line = ""
	for i in range(-3, 4):  # Show 3 scions to the left and right of the current selection
		var index = (selected_scion_index + i) % Scions.scions.size()
		if index < 0:
			index += Scions.scions.size()  # Ensure positive wrapping
		if i == 0:
			# Highlight the selected scion
			scion_line += "[" + Scions.scions[index]["symbol"] + "] "
		else:
			scion_line += Scions.scions[index]["symbol"] + " "
	
	output += pad_center(scion_line, screen_width - 2) + "\n"
	output += "─".repeat(screen_width - 2) + "\n"  # Changed from '-' to '─' for better alignment

	# Display selected scion details
	var selected_scion = Scions.scions[selected_scion_index]
	output += "║" + pad_center("Name: " + selected_scion["name"], screen_width - 2) + "║\n"
	
	# Fetch and display scion stats
	var stats = selected_scion["stats"]
	output += "║" + pad_center("Power: " + str(stats["power"]), screen_width - 2) + "║\n"
	output += "║" + pad_center("Imagination: " + str(stats["imagination"]), screen_width - 2) + "║\n"
	output += "║" + pad_center("Agility: " + str(stats["agility"]), screen_width - 2) + "║\n"
	output += "║" + pad_center("Acuity: " + str(stats["acuity"]), screen_width - 2) + "║\n"
	output += "║" + pad_center("Mutability: " + str(stats["mutability"]), screen_width - 2) + "║\n"
	output += "║" + pad_center("Otherness: " + str(stats["otherness"]), screen_width - 2) + "║\n"
	
	# Spacer
	output += "║" + " ".repeat(screen_width - 2) + "║\n"  
	output += "║" + " ".repeat(screen_width - 2) + "║\n"  

	# Display selected scions at the bottom
	output += "║" + pad_center("Selected Scions:", screen_width - 2) + "║\n"
	var selected_line = ""
	for scion in selected_scions:
		selected_line += scion["symbol"] + " "
	output += "║" + pad_center(selected_line.strip_edges(), screen_width - 2) + "║\n"  # Ensured trim and padding

	# Pad remaining space to fill the screen
	while output.split("\n").size() < SCREEN_HEIGHT:
		output += "║" + " ".repeat(screen_width - 2) + "║\n"

	# Return the built output
	return output

func pad_center(text: String, width: int) -> String:
	var total_padding = max(width - text.length(), 0)
	var left_padding = total_padding / 2
	var right_padding = total_padding - left_padding
	return " ".repeat(left_padding) + text + " ".repeat(right_padding)
