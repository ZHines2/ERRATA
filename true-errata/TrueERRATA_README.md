
# TrueERRATA

**TrueERRATA** is a modular build of the ERRATA project, designed for simplicity and efficiency. This repository contains key scripts that drive the core functionality of the game. Each script plays a specific role in managing the gameplay experience and debugging process.

## File Overview

### 1. **BackgroundManager.gd**
Manages background tasks and initializes debugging channels.
- **Key Features:**
  - Initializes background tasks dynamically.
  - Loads and attaches the `DebugChannel.gd` script for seamless debugging.
  - Easily extensible for adding more background tasks or utilities.

```gdscript
extends Node

# List of background tasks
var background_tasks = []

# Called when the node enters the scene tree for the first time
func _ready():
	# Initialize background tasks
	_initialize_background_tasks()

# Method to initialize background tasks
func _initialize_background_tasks():
	# Directly use the constant string path for the debug channel script
	var debug_channel_script = preload("res://channels/DebugChannel.gd").new()
	add_child(debug_channel_script)
	background_tasks.append(debug_channel_script)
```

### 2. **ScreenManager.gd**
Manages the active screen and tracks navigation history.
- **Key Features:**
  - Handles screen transitions dynamically using a dictionary of screen paths.
  - Maintains a stack for screen history, allowing users to return to previous screens.
  - Includes robust error handling for missing or invalid screens.

```gdscript
extends Node

# Current screen node
var current_screen = null
# Stack to keep track of screen history
var screen_stack = []

# Dictionary to map screen names to their paths
var screen_paths = {
	"MainMenu": preload("res://screens/MainMenu.gd"),
	"OtherScreen": preload("res://screens/OtherScreen.gd")
}

# Method to switch between screens
func switch_screen(screen_name: String):
	# Unload the current screen
	if current_screen != null:
		remove_child(current_screen)
		current_screen.queue_free()
	
	# Preload the correct screen using the dictionary
	if screen_name in screen_paths:
		current_screen = screen_paths[screen_name].new()
		add_child(current_screen)
		screen_stack.append(screen_name)
	else:
		print("Error: Screen not found for name: " + screen_name)

# Method to go back to the previous screen
func go_back():
	if screen_stack.size() > 1:
		screen_stack.pop_back()
		switch_screen(screen_stack.back())
```

### 3. **TrueERRATA.gd**
Serves as the core entry point for the game.
- **Key Features:**
  - Initializes and integrates `BackgroundManager.gd` and `ScreenManager.gd`.
  - Sets up the default screen for the game.
  - Acts as the main hub for gameplay logic and inter-script communication.

```gdscript
extends Node

# References to managers
var background_manager
var screen_manager

# Called when the node enters the scene tree for the first time
func _ready():
	# Initialize and add the BackgroundManager
	background_manager = preload("res://BackgroundManager.gd").new()
	add_child(background_manager)
	
	# Initialize and add the ScreenManager
	screen_manager = preload("res://ScreenManager.gd").new()
	add_child(screen_manager)
	
	# Set up the initial screen to MainMenu (or any other screen you want to start with)
	screen_manager.switch_screen("MainMenu")
```

### 4. **DebugChannel.gd**
Provides real-time debugging information and logging.
- **Key Features:**
  - Displays active game states and manager statuses in a debug label.
  - Utilizes a timer to update debug information periodically.
  - Offers a flexible framework for adding more debug tests and features.

```gdscript
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
```

## Setup Instructions

1. Place all scripts in the appropriate directories within your Godot project.
2. Ensure all dependencies and references are correctly linked.
3. Launch the game and monitor the debug channel for any errors or anomalies.

## Known Issues

1. **[Issue Placeholder]:** Describe the issue here.
   - **Steps to Reproduce:** Describe how to reproduce the issue.
   - **Potential Fix:** Suggested solutions or areas to investigate.

## Debugging Guide

Use the `DebugChannel.gd` script to track game variables and resolve issues efficiently. Log outputs will appear in the Godot editor's debug console.

## Contribution Guidelines

Feel free to contribute by:

- Identifying and reporting bugs.
- Suggesting improvements or optimizations.
- Submitting pull requests with detailed explanations.

---

Let me know if there are additional details you'd like included or specific known issues to add under "Known Issues." Once finalized, we can export this README for your use.
