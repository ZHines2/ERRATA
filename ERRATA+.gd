extends Node

# Define screen dimensions and settings
const SCREEN_WIDTH: int = 80
const SCREEN_HEIGHT: int = 15

# Characters for static and scenes
const STATIC_CHARACTERS: PackedStringArray = ['.', '*', '#', '@', '-', '+', '~', '^']
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

# Scion Data
const SCIONS: Array = [
	{"name": "Aar", "glyph": "Ψ", "stats": {"power": 1, "imagination": 7, "agility": 6, "acuity": 3, "mutability": 3, "otherness": 5}},
	{"name": "Ro", "glyph": "Δ", "stats": {"power": 5, "imagination": 3, "agility": 2, "acuity": 5, "mutability": 5, "otherness": 5}},
	{"name": "Gio", "glyph": "φ", "stats": {"power": 6, "imagination": 2, "agility": 6, "acuity": 4, "mutability": 4, "otherness": 3}},
	{"name": "Mem", "glyph": "Ω", "stats": {"power": 7, "imagination": 2, "agility": 4, "acuity": 2, "mutability": 4, "otherness": 6}},
	{"name": "Red", "glyph": "Σ", "stats": {"power": 5, "imagination": 3, "agility": 3, "acuity": 4, "mutability": 4, "otherness": 6}},
	{"name": "Lag", "glyph": "Ξ", "stats": {"power": 5, "imagination": 2, "agility": 8, "acuity": 3, "mutability": 4, "otherness": 3}},
	{"name": "Bng", "glyph": "Ж", "stats": {"power": 6, "imagination": 4, "agility": 3, "acuity": 8, "mutability": 2, "otherness": 2}},
	{"name": "Yg", "glyph": "ϑ", "stats": {"power": 4, "imagination": 2, "agility": 2, "acuity": 8, "mutability": 5, "otherness": 4}},
	{"name": "Tsa", "glyph": "Π", "stats": {"power": 2, "imagination": 6, "agility": 4, "acuity": 3, "mutability": 5, "otherness": 5}},
	{"name": "Ith", "glyph": "Λ", "stats": {"power": 3, "imagination": 5, "agility": 4, "acuity": 4, "mutability": 3, "otherness": 6}},
	{"name": "Oj", "glyph": "Γ", "stats": {"power": 2, "imagination": 8, "agility": 2, "acuity": 4, "mutability": 3, "otherness": 6}},
	{"name": "Sha", "glyph": "Ш", "stats": {"power": 6, "imagination": 8, "agility": 6, "acuity": 3, "mutability": 2, "otherness": 0}},
	{"name": "Glo", "glyph": "Ю", "stats": {"power": 2, "imagination": 2, "agility": 6, "acuity": 7, "mutability": 4, "otherness": 4}},
	{"name": "Urc", "glyph": "Ѭ", "stats": {"power": 4, "imagination": 6, "agility": 5, "acuity": 4, "mutability": 2, "otherness": 4}},
	{"name": "Hot", "glyph": "Ѳ", "stats": {"power": 5, "imagination": 6, "agility": 4, "acuity": 3, "mutability": 5, "otherness": 2}},
	{"name": "Bo", "glyph": "З", "stats": {"power": 0, "imagination": 5, "agility": 3, "acuity": 3, "mutability": 9, "otherness": 5}},
	{"name": "He", "glyph": "Є", "stats": {"power": 4, "imagination": 3, "agility": 8, "acuity": 2, "mutability": 5, "otherness": 3}},
	{"name": "Viq", "glyph": "Ҩ", "stats": {"power": 1, "imagination": 8, "agility": 6, "acuity": 3, "mutability": 4, "otherness": 3}},
	{"name": "Wey", "glyph": "Ѡ", "stats": {"power": 4, "imagination": 6, "agility": 1, "acuity": 4, "mutability": 4, "otherness": 6}},
	{"name": "La", "glyph": "Ϟ", "stats": {"power": 2, "imagination": 3, "agility": 4, "acuity": 1, "mutability": 9, "otherness": 6}},
	{"name": "Gas", "glyph": "Ϡ", "stats": {"power": 3, "imagination": 4, "agility": 3, "acuity": 6, "mutability": 5, "otherness": 4}},
	{"name": "To", "glyph": "Ѧ", "stats": {"power": 4, "imagination": 2, "agility": 5, "acuity": 5, "mutability": 6, "otherness": 3}},
	{"name": "Mik", "glyph": "ϰ", "stats": {"power": 5, "imagination": 4, "agility": 4, "acuity": 8, "mutability": 3, "otherness": 1}},
	{"name": "Er", "glyph": "Ѯ", "stats": {"power": 7, "imagination": 4, "agility": 1, "acuity": 7, "mutability": 1, "otherness": 5}},
	{"name": "Z", "glyph": "ϡ", "stats": {"power": 2, "imagination": 6, "agility": 5, "acuity": 4, "mutability": 3, "otherness": 5}},
	{"name": "Din", "glyph": "Ϥ", "stats": {"power": 0, "imagination": 4, "agility": 6, "acuity": 7, "mutability": 4, "otherness": 4}},
	{"name": "Enn", "glyph": "Ҵ", "stats": {"power": 3, "imagination": 6, "agility": 7, "acuity": 2, "mutability": 4, "otherness": 3}},
	{"name": "Mor", "glyph": "Ѱ", "stats": {"power": 2, "imagination": 4, "agility": 3, "acuity": 5, "mutability": 5, "otherness": 6}},
	{"name": "Gan", "glyph": "Њ", "stats": {"power": 4, "imagination": 4, "agility": 2, "acuity": 5, "mutability": 3, "otherness": 7}},
	{"name": "Ac", "glyph": "Җ", "stats": {"power": 2, "imagination": 5, "agility": 4, "acuity": 3, "mutability": 6, "otherness": 5}}
]

# Timer for updates
var update_interval: float = 0.9
var time_passed: float = 0.0

# Channel states
var current_channel: int = 0
var beach_offset: int = 0
var scroll_offset: int = SCREEN_HEIGHT

# Scion selection state
var selected_scion_index: int = 0
var selected_scions: Array = []  # Holds up to 10 selected scions

func _ready():
	print("Starting Multi-Channel Screen Saver...")
	display_screen()

func _process(delta: float):
	time_passed += delta
	if time_passed >= update_interval:
		time_passed = 0.0
		if current_channel == 1:  # Beach scene movement
			beach_offset = (beach_offset + 1) % (SCREEN_WIDTH - 2)
		elif current_channel == 2:  # Scrolling text movement
			scroll_offset -= 1
			if scroll_offset + STORY_TEXT.size() < 0:  # Reset scrolling
				scroll_offset = SCREEN_HEIGHT
		display_screen()

func _input(event: InputEvent):
	# Detect mouse left-click for channel switching
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Cycle channels forward
		current_channel = (current_channel + 1) % 4  # Adjusted for 4 channels
		display_screen()

	# Handle scion selection in Channel 4
	if current_channel == 3:
		if event.is_action_pressed("ui_left"):
			selected_scion_index = (selected_scion_index - 1 + SCIONS.size()) % SCIONS.size()
			display_screen()
		elif event.is_action_pressed("ui_right"):
			selected_scion_index = (selected_scion_index + 1) % SCIONS.size()
			display_screen()
		elif event.is_action_pressed("ui_accept"):
			var selected_scion = SCIONS[selected_scion_index]
			if selected_scion in selected_scions:
				selected_scions.erase(selected_scion)
			else:
				if selected_scions.size() < 10:
					selected_scions.append(selected_scion)
			display_screen()

func display_screen():
	var title = " ERRATA - CHANNEL " + str(current_channel + 1)
	var padding = (SCREEN_WIDTH - 2 - title.length()) / 2
	var screen_output = "╔" + "═".repeat(padding) + title + "═".repeat(SCREEN_WIDTH - 2 - padding - title.length()) + "╗\n"

	if current_channel == 0:
		# Static channel
		screen_output += render_static()
	elif current_channel == 1:
		# Beach channel
		screen_output += render_beach()
	elif current_channel == 2:
		# Scrolling text channel
		screen_output += render_scrolling_text()
	elif current_channel == 3:
		# Scion selection channel
		screen_output += render_scion_selection()

	screen_output += "╚" + "═".repeat(SCREEN_WIDTH - 2) + "╝\n"

	# Clear console simulation (output enough lines to push old content out)
	for i in range(10):  # Fixed loop variable
		print("")

	print(screen_output)

func render_static() -> String:
	var output: String = ""
	for row in range(SCREEN_HEIGHT):
		var line: String = ""
		for col in range(SCREEN_WIDTH - 2):
			line += STATIC_CHARACTERS[randi() % STATIC_CHARACTERS.size()]
		output += "║" + line + "║\n"
	return output

func render_beach() -> String:
	var output: String = ""
	for line in BEACH_SCENE:
		var moved_line = line.substr(beach_offset) + line.substr(0, beach_offset)
		var padded_line = pad_center(moved_line, SCREEN_WIDTH - 2)
		output += "║" + padded_line + "║\n"
	for row in range(SCREEN_HEIGHT - BEACH_SCENE.size()):
		output += "║" + " ".repeat(SCREEN_WIDTH - 2) + "║\n"
	return output

func render_scrolling_text() -> String:
	var output: String = ""
	for row in range(SCREEN_HEIGHT):
		var text_row: int = row - scroll_offset
		if text_row >= 0 and text_row < STORY_TEXT.size():
			var line = STORY_TEXT[text_row]
			var padded_line = pad_center(line, SCREEN_WIDTH - 2)
			output += "║" + padded_line + "║\n"
		else:
			output += "║" + " ".repeat(SCREEN_WIDTH - 2) + "║\n"
	return output

func render_scion_selection() -> String:
	var output: String = ""

	# Display turntable of scions
	var scion_line = ""
	for i in range(-3, 4):  # Show 3 scions to the left and right of the current selection
		var index = (selected_scion_index + i) % SCIONS.size()
		if index < 0:
			index += SCIONS.size()  # Ensure positive wrapping
		if i == 0:
			# Highlight the selected scion
			scion_line += "[" + SCIONS[index]["glyph"] + "] "
		else:
			scion_line += SCIONS[index]["glyph"] + " "

	output += pad_center(scion_line, SCREEN_WIDTH - 2) + "\n"
	output += "─".repeat(SCREEN_WIDTH - 2) + "\n"  # Changed from '-' to '─' for better alignment

	# Display selected scion details
	var selected_scion = SCIONS[selected_scion_index]
	output += "║" + pad_center("Name: " + selected_scion["name"], SCREEN_WIDTH - 2) + "║\n"
	
	# Fetch and display scion stats
	var stats = selected_scion["stats"]
	output += "║" + pad_center("Power: " + str(stats["power"]), SCREEN_WIDTH - 2) + "║\n"
	output += "║" + pad_center("Imagination: " + str(stats["imagination"]), SCREEN_WIDTH - 2) + "║\n"
	output += "║" + pad_center("Agility: " + str(stats["agility"]), SCREEN_WIDTH - 2) + "║\n"
	output += "║" + pad_center("Acuity: " + str(stats["acuity"]), SCREEN_WIDTH - 2) + "║\n"
	output += "║" + pad_center("Mutability: " + str(stats["mutability"]), SCREEN_WIDTH - 2) + "║\n"
	output += "║" + pad_center("Otherness: " + str(stats["otherness"]), SCREEN_WIDTH - 2) + "║\n"
	
	# Spacer
	output += "║" + " ".repeat(SCREEN_WIDTH - 2) + "║\n"  
	output += "║" + " ".repeat(SCREEN_WIDTH - 2) + "║\n"  

	# Display selected scions at the bottom
	output += "║" + pad_center("Selected Scions:", SCREEN_WIDTH - 2) + "║\n"
	var selected_line = ""
	for scion in selected_scions:
		selected_line += scion["glyph"] + " "
	output += "║" + pad_center(selected_line.strip_edges(), SCREEN_WIDTH - 2) + "║\n"  # Ensured trim and padding

	# Pad remaining space to fill the screen
	while output.split("\n").size() < SCREEN_HEIGHT:
		output += "║" + " ".repeat(SCREEN_WIDTH - 2) + "║\n"

	# Return the built output
	return output

# Custom function to center-align text within a given width
func pad_center(text: String, width: int) -> String:
	var total_padding = max(width - text.length(), 0)
	var left_padding = total_padding / 2
	var right_padding = total_padding - left_padding
	return " ".repeat(left_padding) + text + " ".repeat(right_padding)
