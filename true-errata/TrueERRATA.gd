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
