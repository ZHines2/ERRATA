# DungeonGeneration.gd
extends Node2D

const DUNGEON_SIZE = 20
var dungeon = []
var player_pos = Vector2(1, 1)

func _ready():
	generate_dungeon()
	draw_dungeon()

func generate_dungeon():
	dungeon = []
	for y in range(DUNGEON_SIZE):
		var row = []
		for x in range(DUNGEON_SIZE):
			if randf() < 0.2:
				row.append("#")  # Wall
			else:
				row.append(".")  # Floor
		dungeon.append(row)
	dungeon[player_pos.y][player_pos.x] = "@"  # Player start position

func draw_dungeon():
	var dungeon_str = ""
	for y in range(DUNGEON_SIZE):
		for x in range(DUNGEON_SIZE):
			dungeon_str += dungeon[y][x]
		dungeon_str += "\n"
	print(dungeon_str)

func _input(event):
	if event is InputEventKey:
		match event.scancode:
			KEY_W:
				move_player(Vector2(0, -1))
			KEY_S:
				move_player(Vector2(0, 1))
			KEY_A:
				move_player(Vector2(-1, 0))
			KEY_D:
				move_player(Vector2(1, 0))

func move_player(direction):
	var new_pos = player_pos + direction
	if new_pos.x >= 0 and new_pos.x < DUNGEON_SIZE and new_pos.y >= 0 and new_pos.y < DUNGEON_SIZE:
		if dungeon[new_pos.y][new_pos.x] != "#":
			player_pos = new_pos
			dungeon[player_pos.y][player_pos.x] = "@"
			draw_dungeon()
