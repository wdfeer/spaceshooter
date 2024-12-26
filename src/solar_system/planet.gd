extends Polygon2D

@onready
var sun: Node2D = $"../Sun"
@onready
var orbit_speed: float = 300 / sqrt(sun.global_position.distance_to(global_position))

func get_velocity(delta: float) -> Vector2:
	return position.direction_to(sun.position).rotated(PI / 2) * delta * orbit_speed

func _process(delta: float) -> void:
	var v = get_velocity(delta)
	position += v
	rotation = v.angle() + PI / 2
