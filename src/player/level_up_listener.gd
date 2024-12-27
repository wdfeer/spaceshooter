extends Node

@export
var levelup_menu_scene: PackedScene

func _ready() -> void:
	Stats.levelup.connect(_on_levelup)

func _on_levelup():
	get_tree().paused = true
	var menu: LevelUpMenu = levelup_menu_scene.instantiate()
	add_child(menu)
	menu.global_position = get_parent().global_position
	menu.add_option("OPTION 1")
	menu.add_option("OPTION 2")
	menu.add_option("OPTION 3")
