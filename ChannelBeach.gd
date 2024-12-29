extends Node

const BEACH_SCENE: Array = [
	"                    ~~~~~~~~                        ",
	"      ~~~~      ~~~~~~~~~~~~~~~~       ~~~~        ",
	" ~~~~~~~~~~~  ~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~~~    ",
	"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ",
	"     ______    __   __  _______  _______           ",
	"    |      |  |  |_|  ||       ||       |          ",
	"    |  _    ||       ||   _   ||    ___|          ",
	"    | | |   ||       ||  | |  ||   |___           ",
	"    | |_|   ||       ||  |_|  ||    ___|          ",
	"    |       || ||_|| ||       ||   |___           ",
	"    |______| |_|   |_||_______||_______|          ",
	"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ",
	" ~~~~~~~~~~~  ~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~~~    ",
	"      ~~~~      ~~~~~~~~~~~~~~~~       ~~~~        ",
	"                    ~~~~~~~~                        ",
]

func render_beach(screen_width: int, screen_height: int, beach_offset: int) -> String:
	var output: String = ""
	for line in BEACH_SCENE:
		var moved_line = line.substr(beach_offset) + line.substr(0, beach_offset)
		var padded_line = pad_center(moved_line, screen_width - 2)
		output += "║" + padded_line + "║\n"
	for row in range(screen_height - BEACH_SCENE.size()):
		output += "║" + " ".repeat(screen_width - 2) + "║\n"
	return output

func pad_center(text: String, width: int) -> String:
	var total_padding = max(width - text.length(), 0)
	var left_padding = total_padding / 2
	var right_padding = total_padding - left_padding
	return " ".repeat(left_padding) + text + " ".repeat(right_padding)
