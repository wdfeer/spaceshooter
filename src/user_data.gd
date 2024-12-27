extends Node

var kill_count: int = 0
var upgrade_points: int = 0

func _ready() -> void:
	load_game()

func save_game():
	var file = FileAccess.open("user://save", FileAccess.WRITE)
	file.store_32(kill_count)
	file.store_32(upgrade_points)

func load_game():
	var file = FileAccess.open("user://save", FileAccess.READ)
	if file:
		kill_count = file.get_32()
		upgrade_points = file.get_32()
