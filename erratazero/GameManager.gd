extends Node

func _ready():
	var child_node = get_node_or_null("ChildNode")  # Adjust the path as needed
	if child_node:
		remove_child(child_node)
	else:
		print("Error: ChildNode not found.")
