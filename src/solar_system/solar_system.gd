extends Area2D
pass # Replace with function body.
func _on_area_exited(area: Area2D) -> void:
	if area is Player:
		area.global_position = global_position

@export
var mars_scene: PackedScene
func _on_mars_loader_area_entered(area: Area2D) -> void:
	if area is Player:
		get_tree().change_scene_to_packed(mars_scene)
