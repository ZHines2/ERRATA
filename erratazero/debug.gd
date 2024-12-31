extends Node

# Load the scripts to be tested
var ScionSelection = preload("res://ScionSelection.gd")
var Dungeon = preload("res://DungeonGeneration.gd")
var Controls = preload("res://controls.gd")
var GameManager = preload("res://GameManager.gd")
var Combat = preload("res://combat.gd")
var EntityManager = preload("res://EntityManager.gd")

func _ready():
	print("Starting Debug Tests...\n")
	var success = true

	# Test Scion Selection
	print("Testing Scion Selection...")
	success = success and test_scion_selection()

	# Test Dungeon Generation
	print("Testing Dungeon Generation...")
	success = success and test_dungeon_generation()

	# Test Controls
	print("Testing Controls...")
	success = success and test_controls()

	# Test Game Management
	print("Testing Game Management...")
	success = success and test_game_management()

	# Test Combat System
	print("Testing Combat System...")
	success = success and test_combat_system()

	# Test Entity Management
	print("Testing Entity Management...")
	success = success and test_entity_management()

	if success:
		print("\nAll tests passed successfully!")
	else:
		print("\nSome tests failed. Check the above output for details.")

func test_scion_selection():
	var scion_selection = ScionSelection.new()
	scion_selection._ready()
	if scion_selection.selected_scion:
		print("Scion Selection test passed.")
		return true
	else:
		print("Scion Selection test failed: No scion selected.")
		return false

func test_dungeon_generation():
	var dungeon = Dungeon.new()
	dungeon._ready()
	if len(dungeon.dungeon) == Dungeon.DUNGEON_SIZE:
		print("Dungeon Generation test passed.")
		return true
	else:
		print("Dungeon Generation test failed: Incorrect dungeon size.")
		return false

func test_controls():
	var controls = Controls.new()
	controls._input(InputEventKey.new())  # Simulate a key press
	print("Controls test passed (no errors).")
	return true

func test_game_management():
	var game_manager = GameManager.new()
	game_manager._ready()
	print("Game Management test passed (no errors).")
	return true

func test_combat_system():
	var combat = Combat.new()
	var player_scion = {"name": "Test Player", "symbol": "@", "stats": {"power": 5, "imagination": 5, "agility": 5, "acuity": 5, "mutability": 5, "otherness": 5}}
	var enemy_scion = {"name": "Test Enemy", "symbol": "E", "stats": {"power": 5, "imagination": 5, "agility": 5, "acuity": 5, "mutability": 5, "otherness": 5}}
	combat.start_combat(player_scion, enemy_scion)
	print("Combat System test passed (no errors).")
	return true

func test_entity_management():
	var entity_manager = EntityManager.new()
	var scion = entity_manager.Scion.new("Test Scion", "@", {"power": 5, "imagination": 5, "agility": 5, "acuity": 5, "mutability": 5, "otherness": 5})
	scion.level_up()
	if scion.stats["power"] == 6:
		print("Entity Management test passed.")
		return true
	else:
		print("Entity Management test failed: Level up not working.")
		return false
