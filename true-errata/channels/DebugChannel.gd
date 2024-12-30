extends Node2D

var label: Label
var update_timer: Timer

# Called when the node enters the scene tree for the first time
func _ready():
	# Create and set up the label
	label = Label.new()
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	label.size_flags_vertical = Control.SIZE_EXPAND_FILL
	add_child(label)
	
	# Create and set up the timer for periodic updates
	update_timer = Timer.new()
	update_timer.wait_time = 1.0  # Update every second
	update_timer.connect("timeout", Callable(self, "_update_debug_info"))
	add_child(update_timer)
	update_timer.start()
	
	# Initial update
	_update_debug_info()

# Method to update debug information
func _update_debug_info():
	var debug_info = "Debug Information:\n"
	
	# BackgroundManager status
	if get_node("/root/TrueERRATA/BackgroundManager"):
		debug_info += "BackgroundManager status: Running\n"
	else:
		debug_info += "BackgroundManager status: Not Running\n"
	
	# ScreenManager status
	if get_node("/root/TrueERRATA/ScreenManager"):
		debug_info += "ScreenManager status: Running\n"
	else:
		debug_info += "ScreenManager status: Not Running\n"
	
	# Update the label text
	label.text = debug_info

# Optionally, you can add more methods to run specific tests
func _run_tests():
	print("Running tests...")
	# Example test: Check if a background script is running
	if get_node("/root/TrueERRATA/BackgroundManager"):
		print("BackgroundManager is present and running.")
	else:
		print("BackgroundManager is missing or not running.")
	# Add more tests as needed
