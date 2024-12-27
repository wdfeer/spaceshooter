extends Label

@onready
var base_text = text
func _process(delta: float) -> void:
	text = base_text % UserData.upgrade_points
