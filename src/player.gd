extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	var vy := Input.get_axis("up", "down") 
	var vx := Input.get_axis("left", "right")
	velocity = Vector2(vx, vy) * SPEED
	move_and_slide()
	
	if velocity.length() > 0:
		rotation = velocity.angle() + PI / 2
