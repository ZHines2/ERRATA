extends Node

const STORY_TEXT: Array = [
	"Beyond the veil of known existence lies a fractured realm,",
	"teetering on the edge of unraveling. Shards of forgotten wisdom",
	"drift in the void, each a fragment of a story too vast for",
	"comprehension. From this chaos emerged thirty enigmatic beings,",
	"neither fully born nor summoned, their presence a ripple through",
	"the fabric of reality itself. They carry no names, only symbols,",
	"their origins shrouded in the silence of eternity. Each step they",
	"take distorts the ground beneath them, as though the world itself",
	"struggles to reconcile their existence. Their purpose is unclear,",
	"yet the weight of their arrival presses against the universe,",
	"bending its laws and unearthing truths hidden even from time.",
	"",
	"This is a place of flux, where boundaries between dimensions blur,",
	"and every choice etches its consequences into the infinite. These",
	"beings move through a realm where whispers become storms, and the",
	"unseen pulls the strings of fate. Their actions are unknowable yet",
	"inevitable, shaping a reality that trembles under their gaze. As",
	"they wander, echoes of a forgotten visionary linger in the air,",
	"their words like a faint melody guiding the lost. The scions carry",
	"within them the potential for creation and destruction, yet their",
	"steps remain steady, as though some unseen force compels them toward",
	"a horizon where meaning might finally emerge."
]

func render_scrolling_text(screen_width: int, screen_height: int, scroll_offset: int) -> String:
	var output: String = ""
	for row in range(screen_height):
		var text_row: int = row - scroll_offset
		if text_row >= 0 and text_row < STORY_TEXT.size():
			var line = STORY_TEXT[text_row]
			var padded_line = pad_center(line, screen_width - 2)
			output += "║" + padded_line + "║\n"
		else:
			output += "║" + " ".repeat(screen_width - 2) + "║\n"
	return output

func pad_center(text: String, width: int) -> String:
	var total_padding = max(width - text.length(), 0)
	var left_padding = total_padding / 2
	var right_padding = total_padding - left_padding
	return " ".repeat(left_padding) + text + " ".repeat(right_padding)
