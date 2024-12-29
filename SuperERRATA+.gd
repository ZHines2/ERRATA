extends Node

# Define screen dimensions and settings
const SCREEN_WIDTH: int = 80
const SCREEN_HEIGHT: int = 15

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

# Load and instantiate channel scripts
var channel_scripts = [
	preload("res://ChannelStatic.gd").new(),
	preload("res://ChannelBeach.gd").new(),
	preload("res://ChannelScrollingText.gd").new(),
	preload("res://ChannelScionSelection.gd").new(),
	preload("res://ChannelExodus.gd").new()  # Adding the EXODUS channel script
]

# Load SCIONS.gd script
var Scions = load("res://SCIONS.gd").new()

func _ready():
	print("Starting Multi-Channel Screen Saver...")
	for channel in channel_scripts:
		if channel.has_method("_ready"):
			channel._ready()
	display_screen()

func _process(delta: float):
	time_passed += delta
	if time_passed >= update_interval:
		time_passed = 0.0
		update_channel_states()
		display_screen()

func update_channel_states():
	if current_channel == 1:  # Beach scene movement
		beach_offset = (beach_offset + 1) % (SCREEN_WIDTH - 2)
	elif current_channel == 2:  # Scrolling text movement
		scroll_offset -= 1
		# Reset scrolling
		var channel = channel_scripts[2]
		if scroll_offset + channel.STORY_TEXT.size() < 0:
			scroll_offset = SCREEN_HEIGHT

func _input(event: InputEvent):
	# Detect mouse left-click for channel switching
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Cycle channels forward
		current_channel = (current_channel + 1) % channel_scripts.size()
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

	var channel = channel_scripts[current_channel]
	match current_channel:
		0:
			screen_output += channel.render_static(SCREEN_WIDTH, SCREEN_HEIGHT)
		1:
			screen_output += channel.render_beach(SCREEN_WIDTH, SCREEN_HEIGHT, beach_offset)
		2:
			screen_output += channel.render_scrolling_text(SCREEN_WIDTH, SCREEN_HEIGHT, scroll_offset)
		3:
			screen_output += channel.render_scion_selection(SCREEN_WIDTH, SCREEN_HEIGHT, selected_scion_index, selected_scions)
		4:
			screen_output += channel.render_exodus_level(SCREEN_WIDTH, SCREEN_HEIGHT)

	screen_output += "╚" + "═".repeat(SCREEN_WIDTH - 2) + "╝\n"
	clear_console()
	print(screen_output)

# Clear console simulation
func clear_console():
	for i in range(10):
		print("")

# Custom function to center-align text within a given width
func pad_center(text: String, width: int) -> String:
	var total_padding = max(width - text.length(), 0)
	var left_padding = total_padding / 2
	var right_padding = total_padding - left_padding
	return " ".repeat(left_padding) + text + " ".repeat(right_padding)
