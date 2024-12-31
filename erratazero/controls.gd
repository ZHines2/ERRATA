# controls.gd
extends Node

# This script will handle player input, which can be integrated into dungeon.gd
func _input(event):
	if event is InputEventKey:
		match event.scancode:
			KEY_W:
				emit_signal("move", Vector2(0, -1))
			KEY_S:
				emit_signal("move", Vector2(0, 1))
			KEY_A:
				emit_signal("move", Vector2(-1, 0))
			KEY_D:
				emit_signal("move", Vector2(1, 0))
