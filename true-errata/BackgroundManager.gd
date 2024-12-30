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
