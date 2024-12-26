extends Area2D

const SPEED = 250.0
var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity = global_position.direction_to(get_player_position()) * SPEED
	rotation = velocity.angle() + PI / 2
	global_position += velocity * delta

func get_player_position() -> Vector2:
	var player: Node2D = $"../Player"
	if player:
		return player.global_position
	return Vector2.ZERO
