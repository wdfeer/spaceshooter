class_name Projectile
extends Area2D

var friendly = true
var timeleft: float = 1.5
var velocity: Vector2

func _physics_process(delta: float) -> void:
	position += velocity * delta
	timeleft -= delta
	if timeleft < 0:
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if can_hit(area):
		area.kill()

func can_hit(other: Area2D) -> bool:
	return (friendly and other is Enemy) or (!friendly and other is Player) 
