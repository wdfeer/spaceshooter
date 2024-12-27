extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if is_visible_in_tree() and area is Projectile:
		UserData.save_game()
		area.queue_free()
