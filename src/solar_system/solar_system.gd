extends Area2D


func _on_area_exited(area: Area2D) -> void:
	if area is Player:
		area.global_position = global_position
