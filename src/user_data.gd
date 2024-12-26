extends Node

var kill_count: int = 0

func save():
	var file = FileAccess.open("user://save", FileAccess.WRITE)
	file.store_32(kill_count)

func load():
	var file = FileAccess.open("user://save", FileAccess.READ)
	kill_count = file.get_32()
