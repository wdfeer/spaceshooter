extends Node

func _ready() -> void:
	Stats.levelup.connect(_on_levelup)

func _on_levelup():
	get_tree().paused = true
	var menu = LevelUpMenu.create(
		["ATTACK", "HEALTH"],
		[func(): Stats.attack += 1, func(): Stats.health += 1])
	add_child(menu)
	menu.global_position = get_parent().global_position
