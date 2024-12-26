extends Polygon2D

const COLOR_CHANGE_SPEED: float = 0.1
@onready
var base_color = color
@onready
var target_color: Color = color

func _process(delta: float) -> void:
	var delta_color = target_color - color
	var delta_color_v3 = Vector3(delta_color.r, delta_color.g, delta_color.b)
	if delta_color_v3.length() > 0.01:
		var velocity = delta_color_v3.normalized() * delta * COLOR_CHANGE_SPEED
		var vcolor = Color(velocity.x, velocity.y, velocity.z)
		color += vcolor
	else:
		var r = randf_range(-0.05, 0.05)
		var g = randf_range(-0.05, 0.05)
		var b = randf_range(-0.05, 0.05)
		target_color = base_color + Color(r, g, b)
