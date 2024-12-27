class_name LevelUpMenu
extends Control

var radial_menu: Container

func add_option(text: String, change_stats: Callable):
	radial_menu.add_child(create_option(text, change_stats))

func create_option(txt: String, change_stats: Callable) -> Button:
	var result: Button = Button.new()
	result.text = txt
	result.pressed.connect(_on_option_pressed.bind(change_stats))
	result.add_theme_font_size_override("font_size", 24)
	return result

func _on_option_pressed(change_stats: Callable):
	print("Button PRESSED!!")
	self.queue_free()
	get_tree().paused = false
	change_stats.call()

static var scene: PackedScene = preload("res://src/ui/levelup_menu.tscn")
static func create(option_texts: Array, option_callbacks: Array) -> LevelUpMenu:
	if len(option_texts) != len(option_callbacks):
		error_string(ERR_INVALID_PARAMETER)
	
	var menu: LevelUpMenu = scene.instantiate()
	menu.radial_menu = menu.get_node("RadialMenu")
	for i in len(option_texts):
		menu.add_option(option_texts[i], option_callbacks[i])
	return menu
