class_name Enemy
extends Area2D

const SPEED = 250.0
var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	update_player_position(delta)
	velocity = global_position.direction_to(player_pos) * SPEED
	rotation = velocity.angle() + PI / 2
	global_position += velocity * delta

var player_pos: Vector2 = Vector2.ZERO
func update_player_position(delta: float):
	var player: Node2D = $"../Player"
	if player:
		player_pos = player.global_position

func _on_area_entered(area: Area2D) -> void:
	if area is Player:
		area.queue_free()
