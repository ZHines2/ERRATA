extends Node

# Define scions as an array of dictionaries
var scions = [
	{"name": "Aar", "symbol": "Ψ"},
	{"name": "Ro", "symbol": "Δ"},
	{"name": "Gio", "symbol": "φ"},
	{"name": "Mem", "symbol": "Ω"},
	{"name": "Red", "symbol": "Σ"},
	{"name": "Lag", "symbol": "Ξ"},
	{"name": "Bng", "symbol": "Ж"},
	{"name": "Yg", "symbol": "ϑ"},
	{"name": "Tsa", "symbol": "Π"},
	{"name": "Ith", "symbol": "Λ"},
	{"name": "Oj", "symbol": "Γ"},
	{"name": "Sha", "symbol": "Ш"},
	{"name": "Glo", "symbol": "Ю"},
	{"name": "Urc", "symbol": "Ѭ"},
	{"name": "Hot", "symbol": "Ѳ"},
	{"name": "Bo", "symbol": "З"},
	{"name": "He", "symbol": "Є"},
	{"name": "Viq", "symbol": "Ҩ"},
	{"name": "Wey", "symbol": "Ѡ"},
	{"name": "La", "symbol": "Ϟ"},
	{"name": "Gas", "symbol": "Ϡ"},
	{"name": "To", "symbol": "Ѧ"},
	{"name": "Mik", "symbol": "ϰ"},
	{"name": "Er", "symbol": "Ѯ"},
	{"name": "Z", "symbol": "ϡ"},
	{"name": "Din", "symbol": "Ϥ"},
	{"name": "Enn", "symbol": "Ҵ"},
	{"name": "Mor", "symbol": "Ѱ"},
	{"name": "Gan", "symbol": "Њ"},
	{"name": "Ac", "symbol": "Җ"}
]

# Function to display scions
func display_scion_symbols():
	for scion in scions:
		print("%s: %s" % [scion["name"], scion["symbol"]])

# Test the array
func _ready():
	display_scion_symbols()
