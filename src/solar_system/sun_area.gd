extends Area2D

@onready
var animator: AnimationPlayer = $UIAnimator

func _on_area_entered(area: Area2D) -> void:
	if area is Player:
		animator.play("show")

func _on_area_exited(area: Area2D) -> void:
	if area is Player:
		animator.play_backwards("show")
