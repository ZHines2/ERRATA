extends Node

# Define scions as an array of dictionaries, including stats
var scions = [
	{"name": "Aar", "symbol": "Ψ", "stats": {"power": 1, "imagination": 7, "agility": 6, "acuity": 3, "mutability": 3, "otherness": 5}},
	{"name": "Ro", "symbol": "Δ", "stats": {"power": 5, "imagination": 3, "agility": 2, "acuity": 5, "mutability": 5, "otherness": 5}},
	{"name": "Gio", "symbol": "φ", "stats": {"power": 6, "imagination": 2, "agility": 6, "acuity": 4, "mutability": 4, "otherness": 3}},
	{"name": "Mem", "symbol": "Ω", "stats": {"power": 7, "imagination": 2, "agility": 4, "acuity": 2, "mutability": 4, "otherness": 6}},
	{"name": "Red", "symbol": "Σ", "stats": {"power": 5, "imagination": 3, "agility": 3, "acuity": 4, "mutability": 4, "otherness": 6}},
	{"name": "Lag", "symbol": "Ξ", "stats": {"power": 5, "imagination": 2, "agility": 8, "acuity": 3, "mutability": 4, "otherness": 3}},
	{"name": "Bng", "symbol": "Ж", "stats": {"power": 6, "imagination": 4, "agility": 3, "acuity": 8, "mutability": 2, "otherness": 2}},
	{"name": "Yg", "symbol": "ϑ", "stats": {"power": 4, "imagination": 2, "agility": 2, "acuity": 8, "mutability": 5, "otherness": 4}},
	{"name": "Tsa", "symbol": "Π", "stats": {"power": 2, "imagination": 6, "agility": 4, "acuity": 3, "mutability": 5, "otherness": 5}},
	{"name": "Ith", "symbol": "Λ", "stats": {"power": 3, "imagination": 5, "agility": 4, "acuity": 4, "mutability": 3, "otherness": 6}},
	{"name": "Oj", "symbol": "Γ", "stats": {"power": 2, "imagination": 8, "agility": 2, "acuity": 4, "mutability": 3, "otherness": 6}},
	{"name": "Sha", "symbol": "Ш", "stats": {"power": 6, "imagination": 8, "agility": 6, "acuity": 3, "mutability": 2, "otherness": 0}},
	{"name": "Glo", "symbol": "Ю", "stats": {"power": 2, "imagination": 2, "agility": 6, "acuity": 7, "mutability": 4, "otherness": 4}},
	{"name": "Urc", "symbol": "Ѭ", "stats": {"power": 4, "imagination": 6, "agility": 5, "acuity": 4, "mutability": 2, "otherness": 4}},
	{"name": "Hot", "symbol": "Ѳ", "stats": {"power": 5, "imagination": 6, "agility": 4, "acuity": 3, "mutability": 5, "otherness": 2}},
	{"name": "Bo", "symbol": "З", "stats": {"power": 0, "imagination": 5, "agility": 3, "acuity": 3, "mutability": 9, "otherness": 5}},
	{"name": "He", "symbol": "Є", "stats": {"power": 4, "imagination": 3, "agility": 8, "acuity": 2, "mutability": 5, "otherness": 3}},
	{"name": "Viq", "symbol": "Ҩ", "stats": {"power": 1, "imagination": 8, "agility": 6, "acuity": 3, "mutability": 4, "otherness": 3}},
	{"name": "Wey", "symbol": "Ѡ", "stats": {"power": 4, "imagination": 6, "agility": 1, "acuity": 4, "mutability": 4, "otherness": 6}},
	{"name": "La", "symbol": "Ϟ", "stats": {"power": 2, "imagination": 3, "agility": 4, "acuity": 1, "mutability": 9, "otherness": 6}},
	{"name": "Gas", "symbol": "Ϡ", "stats": {"power": 3, "imagination": 4, "agility": 3, "acuity": 6, "mutability": 5, "otherness": 4}},
	{"name": "To", "symbol": "Ѧ", "stats": {"power": 4, "imagination": 2, "agility": 5, "acuity": 5, "mutability": 6, "otherness": 3}},
	{"name": "Mik", "symbol": "ϰ", "stats": {"power": 5, "imagination": 4, "agility": 4, "acuity": 8, "mutability": 3, "otherness": 1}},
	{"name": "Er", "symbol": "Ѯ", "stats": {"power": 7, "imagination": 4, "agility": 1, "acuity": 7, "mutability": 1, "otherness": 5}},
	{"name": "Z", "symbol": "ϡ", "stats": {"power": 2, "imagination": 6, "agility": 5, "acuity": 4, "mutability": 3, "otherness": 5}},
	{"name": "Din", "symbol": "Ϥ", "stats": {"power": 0, "imagination": 4, "agility": 6, "acuity": 7, "mutability": 4, "otherness": 4}},
	{"name": "Enn", "symbol": "Ҵ", "stats": {"power": 3, "imagination": 6, "agility": 7, "acuity": 2, "mutability": 4, "otherness": 3}},
	{"name": "Mor", "symbol": "Ѱ", "stats": {"power": 2, "imagination": 4, "agility": 3, "acuity": 5, "mutability": 5, "otherness": 6}},
	{"name": "Gan", "symbol": "Њ", "stats": {"power": 4, "imagination": 4, "agility": 2, "acuity": 5, "mutability": 3, "otherness": 7}},
	{"name": "Ac", "symbol": "Җ", "stats": {"power": 2, "imagination": 5, "agility": 4, "acuity": 3, "mutability": 6, "otherness": 5}}
]

# Function to display scions with their symbols
func display_scion_symbols():
	for scion in scions:
		print("%s: %s" % [scion["name"], scion["symbol"]])

# Function to display scions with their stats
func display_scion_stats():
	for scion in scions:
		var stats = scion["stats"]
		print("%s: %s, Stats: Power %d, Imagination %d, Agility %d, Acuity %d, Mutability %d, Otherness %d" % [
			scion["name"],
			scion["symbol"],
			stats["power"],
			stats["imagination"],
			stats["agility"],
			stats["acuity"],
			stats["mutability"],
			stats["otherness"]
		])

# Test the array and display functions
func _ready():
	display_scion_symbols()
	display_scion_stats()
