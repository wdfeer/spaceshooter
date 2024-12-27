class_name LevelUpMenu
extends Control

@onready
var radial_menu: Container = $RadialMenu

func add_option(text: String):
	var label = Label.new()
	label.modulate.v = 0
	label.text = text
	radial_menu.add_child(label)
