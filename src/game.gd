extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	process_enemy_spawn(delta)

const ENEMY_SPAWN_INTERVAL = 1
const ENEMY_SPAWN_DISTANCE = 1000
@export
var enemy_scene: PackedScene
var enemy_spawn_timer = 0
func process_enemy_spawn(delta: float):
	enemy_spawn_timer += delta
	if enemy_spawn_timer > ENEMY_SPAWN_INTERVAL:
		var enemy: Node2D = enemy_scene.instantiate()
		var player: Node2D = $"Player"
		var spawn_pos: Vector2 = player.global_position + Vector2.from_angle(randf_range(0, 2 * PI)) * ENEMY_SPAWN_DISTANCE
		enemy.global_position = spawn_pos
		add_child(enemy)
		enemy_spawn_timer = 0
