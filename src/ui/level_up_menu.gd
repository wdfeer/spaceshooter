class_name LevelUpMenu
extends Control

@onready
var radial_menu: Container = $RadialMenu

func add_option(text: String):
	var label = Label.new()
	label.text = text
	radial_menu.add_child(label)
