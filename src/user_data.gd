extends Node

var kill_count: int = 0

func _ready() -> void:
	load_game()

func save_game():
	var file = FileAccess.open("user://save", FileAccess.WRITE)
	file.store_32(kill_count)

func load_game():
	var file = FileAccess.open("user://save", FileAccess.READ)
	if file:
		kill_count = file.get_32()
