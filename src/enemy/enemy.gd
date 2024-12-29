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
	reset_hp()
	reset_color()

const SPEED = 250.0
var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	update_player_position()
	velocity = global_position.direction_to(player_pos) * SPEED
	rotation = velocity.angle() + PI / 2
	global_position += velocity * delta

var player_pos: Vector2 = Vector2.ZERO
func update_player_position():
	var player: Node2D = get_node_or_null("../Player")
	if player:
		player_pos = player.global_position

var melee_damage: float = 1.0
func _on_area_entered(area: Area2D) -> void:
	if area is Player:
		area.damage(1.0)

var hp: float = 1.0

func reset_hp():
	hp = float(randi_range(1, 2))
func reset_color():
	if hp <= 1:
		modulate = Color.WHITE
	else:
		modulate = Color.BISQUE

func damage(amount: float):
	hp -= amount
	CombatText.instance.damage_number(global_position, amount)
	if hp <= 0:
		kill()

@export
var xp_drop: PackedScene
const UPGRADE_POINT_DROP_CHANCE: float = 1.0

func kill():
	Stats.kill_count += 1
	if randf() < UPGRADE_POINT_DROP_CHANCE:
		call_deferred("drop_xp")
	queue_free()

func drop_xp():
	var drop: Node2D = xp_drop.instantiate()
	add_sibling(drop)
	drop.global_position = global_position
