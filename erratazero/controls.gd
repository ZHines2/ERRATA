extends Node

signal move(direction: Vector2)

# This script will handle player input, which can be integrated into other scripts
func _input(event):
	if event.is_action_pressed("ui_up"):
		emit_signal("move", Vector2(0, -1))
	elif event.is_action_pressed("ui_down"):
		emit_signal("move", Vector2(0, 1))
	elif event.is_action_pressed("ui_left"):
		emit_signal("move", Vector2(-1, 0))
	elif event.is_action_pressed("ui_right"):
		emit_signal("move", Vector2(1, 0))