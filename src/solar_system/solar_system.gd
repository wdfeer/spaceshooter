extends Area2D

func _on_area_exited(area: Area2D) -> void:
	if area is Player:
		area.global_position = global_position

@export
var mars_scene: PackedScene
@export
var earth_scene: PackedScene

func _on_mars_loader_area_entered(area: Area2D) -> void:
	if area is Player:
		get_tree().call_deferred("change_scene_to_packed", mars_scene)

func _on_earth_area_area_entered(area: Area2D) -> void:
	if area is Player:
		get_tree().call_deferred("change_scene_to_packed", earth_scene)
