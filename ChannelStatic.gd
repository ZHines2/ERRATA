extends Node

const STATIC_CHARACTERS: PackedStringArray = ['.', '*', '#', '@', '-', '+', '~', '^']

func render_static(screen_width: int, screen_height: int) -> String:
	var output: String = ""
	for row in range(screen_height):
		var line: String = ""
		for col in range(screen_width - 2):
			line += STATIC_CHARACTERS[randi() % STATIC_CHARACTERS.size()]
		output += "║" + line + "║\n"
	return output
