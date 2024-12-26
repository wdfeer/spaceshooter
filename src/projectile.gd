extends Area2D

var friendly = true
var velocity: Vector2

func _physics_process(delta: float) -> void:
	position += velocity * delta

func _on_area_entered(area: Area2D) -> void:
	if can_hit(area):
		area.queue_free()

func can_hit(other: Area2D) -> bool:
	return true # TODO
