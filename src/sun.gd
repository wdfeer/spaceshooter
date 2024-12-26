extends Polygon2D

func _process(delta: float) -> void:
	process_color(delta)
	process_scale(delta)


const COLOR_CHANGE_SPEED: float = 0.1
@onready
var base_color = color
@onready
var target_color: Color = color
func process_color(delta: float):
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


const SCALE_CHANGE_SPEED: float = 0.1
@onready
var base_scale = scale
@onready
var target_scale = scale
func process_scale(delta: float):
	if scale.distance_to(target_scale) < 0.01:
		var factor = base_scale.x + (randf() * 0.2 - 0.1)
		target_scale = base_scale * factor
	else:
		scale += scale.direction_to(target_scale) * delta * SCALE_CHANGE_SPEED
