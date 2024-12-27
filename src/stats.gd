extends Node

var kill_count: int = 0
var xp: int = 0
var attack: int = 1
var health: int = 1

func _ready() -> void:
	load_game()

func save_game():
	var file = FileAccess.open("user://save", FileAccess.WRITE)
	file.store_32(kill_count)
	file.store_32(xp)
	file.store_32(attack)
	file.store_32(health)

func load_game():
	var file = FileAccess.open("user://save", FileAccess.READ)
	if file:
		kill_count = file.get_32()
		xp = file.get_32()
		attack = file.get_32()
		health = file.get_32()

func increase_xp(amount: int):
	var lvl1 = get_lvl()
	xp += amount
	var lvl2 = get_lvl()
	if lvl2 > lvl1:
		levelup.emit(lvl2 - lvl1)

func get_lvl() -> int:
	return floori(1 + sqrt(xp / 7.0))

signal levelup(level_count: int)
