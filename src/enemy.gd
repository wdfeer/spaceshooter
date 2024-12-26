extends CharacterBody2D

const SPEED = 250.0

func _physics_process(delta: float) -> void:
	velocity = global_position.direction_to(get_player_position()) * SPEED
	rotation = velocity.angle() + PI / 2
	move_and_slide()

func get_player_position() -> Vector2:
	var player: Node2D = $"../Player"
	if player:
		return player.global_position
	return Vector2.ZERO
