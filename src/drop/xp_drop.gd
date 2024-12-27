extends Area2D

func get_player() -> Player:
	return get_node_or_null("/root/Mars/Player")

func _physics_process(delta: float) -> void:
	var player = get_player()
	if not player: return
	
	var velocity = global_position.direction_to(get_player().global_position) * delta * 400
	global_position += velocity

func _on_area_entered(area: Area2D) -> void:
	if area is Player:
		Stats.increase_xp(1)
		queue_free()
