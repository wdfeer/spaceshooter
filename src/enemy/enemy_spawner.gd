extends Node

const ENEMY_SPAWN_INTERVAL = 1
const ENEMY_SPAWN_DISTANCE = 1200
@export
var enemy_scene: PackedScene
var enemy_spawn_timer = 0
var game: Node2D

func _ready() -> void:
	game = $".."
	if game == null:
		error_string(ERR_DOES_NOT_EXIST)

func _process(delta: float) -> void:
	enemy_spawn_timer += delta
	if enemy_spawn_timer > ENEMY_SPAWN_INTERVAL:
		var enemy: Node2D = enemy_scene.instantiate()
		var player: Node2D = game.get_node_or_null("Player")
		if !player:
			return
		var angle = player.global_position.angle_to_point(game.global_position) + randf_range(-PI, PI) / 4
		var spawn_pos: Vector2 = player.global_position + Vector2.from_angle(angle) * ENEMY_SPAWN_DISTANCE
		game.add_child(enemy)
		enemy.global_position = spawn_pos
		enemy_spawn_timer = 0
