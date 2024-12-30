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
		
