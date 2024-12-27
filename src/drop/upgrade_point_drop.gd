extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area is Player:
		UserData.upgrade_points += 1
		queue_free()
