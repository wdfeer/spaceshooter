class_name Player
extends Area2D

const SPEED = 300.0
var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var vy := Input.get_axis("up", "down") 
	var vx := Input.get_axis("left", "right")
	velocity = Vector2(vx, vy) * SPEED
	global_position += velocity * delta
	
	if velocity.length() > 0:
		rotation = velocity.angle() + PI / 2

var hp: float = 1.0
func damage(amount: float):
	hp -= amount
	if is_dead():
		kill()

func is_dead() -> bool:
	return hp <= 0

func kill():
	queue_free()
