extends Area2D

func _on_area_exited(area: Area2D) -> void:
	if area is Player:
		if !area.is_dead():
			call_deferred("change_scene")

func change_scene():
	get_tree().change_scene_to_file("res://src/solar_system/solar_system.tscn")
