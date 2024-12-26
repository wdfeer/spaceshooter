extends Node

const ENEMY_SPAWN_INTERVAL = 1
const ENEMY_SPAWN_DISTANCE = 1000
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
		var player: Node2D = game.get_node("Player")
		if !player:
			return
		var spawn_pos: Vector2 = player.global_position + Vector2.from_angle(randf_range(0, 2 * PI)) * ENEMY_SPAWN_DISTANCE
		enemy.global_position = spawn_pos
		game.add_child(enemy)
		enemy_spawn_timer = 0
