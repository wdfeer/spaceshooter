class_name Enemy
extends Area2D

func _ready() -> void:
	var shapes = get_children().filter(func(x): return (x as Node).name.begins_with("Shape"))
	for s in shapes:
		(s as Node2D).disabled = true
		(s as Node2D).visible = false
	var active_shape: Node2D = shapes.pick_random()
	active_shape.disabled = false
	active_shape.visible = true

const SPEED = 250.0
var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	update_player_position(delta)
	velocity = global_position.direction_to(player_pos) * SPEED
	rotation = velocity.angle() + PI / 2
	global_position += velocity * delta

var player_pos: Vector2 = Vector2.ZERO
func update_player_position(delta: float):
	var player: Node2D = get_node_or_null("../Player")
	if player:
		player_pos = player.global_position

func _on_area_entered(area: Area2D) -> void:
	if area is Player:
		area.dead = true
		area.queue_free()

func kill():
	UserData.kill_count += 1
	queue_free()
