extends Node

# Define the ScionEntity class
class ScionEntity:
	var name: String
	var symbol: String
	var stats: Dictionary

	# Constructor to initialize the scion instance
	func _init(_name: String, _symbol: String, _stats: Dictionary):
		name = _name
		symbol = _symbol
		stats = _stats

	# Method to level up the scion
	func level_up():
		stats["power"] += 1
		stats["imagination"] += 1
		stats["agility"] += 1
		stats["acuity"] += 1
		stats["mutability"] += 1
		stats["otherness"] += 1
		print("Leveled up! New stats: %s" % stats)

# Function to create a scion instance from a dictionary
func create_scion(scion_data: Dictionary) -> ScionEntity:
	return ScionEntity.new(scion_data["name"], scion_data["symbol"], scion_data["stats"])

# Example usage in _ready
func _ready():
	var scions_data = load("res://SCIONS.gd").new().get("scions")
	var scion_instances = []
	for scion_data in scions_data:
		var scion_instance = create_scion(scion_data)
		scion_instances.append(scion_instance)
		print("Created Scion: %s" % scion_instance.name)

	# Example: Level up the first scion
	if scion_instances.size() > 0:
		scion_instances[0].level_up()
