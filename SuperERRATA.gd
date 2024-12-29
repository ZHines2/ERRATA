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

# Load SCIONS.gd script
var Scions = load("res://SCIONS.gd").new()

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
			selected_scion_index = (selected_scion_index - 1 + Scions.scions.size()) % Scions.scions.size()
			display_screen()
		elif event.is_action_pressed("ui_right"):
			selected_scion_index = (selected_scion_index + 1) % Scions.scions.size()
			display_screen()
		elif event.is_action_pressed("ui_accept"):
			var selected_scion = Scions.scions[selected_scion_index]
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

	match current_channel:
		0:
			screen_output += render_static()
		1:
			screen_output += render_beach()
		2:
			screen_output += render_scrolling_text()
		3:
			screen_output += render_scion_selection()

	screen_output += "╚" + "═".repeat(SCREEN_WIDTH - 2) + "╝\n"
	clear_console()
	print(screen_output)

# Clear console simulation
func clear_console():
	for i in range(10):
		print("")

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
		var index = (selected_scion_index + i) % Scions.scions.size()
		if index < 0:
			index += Scions.scions.size()  # Ensure positive wrapping
		if i == 0:
			# Highlight the selected scion
			scion_line += "[" + Scions.scions[index]["symbol"] + "] "
		else:
			scion_line += Scions.scions[index]["symbol"] + " "

	output += pad_center(scion_line, SCREEN_WIDTH - 2) + "\n"
	output += "─".repeat(SCREEN_WIDTH - 2) + "\n"  # Changed from '-' to '─' for better alignment

	# Display selected scion details
	var selected_scion = Scions.scions[selected_scion_index]
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
		selected_line += scion["symbol"] + " "
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
