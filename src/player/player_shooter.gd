extends Timer

const SHOOT_VELOCITY: float = 600

@export
var projectile_scene: PackedScene

@onready
var player: Player = $".."

func _process(delta: float) -> void:
	if Input.is_action_pressed("shoot") && is_stopped():
		shoot()

func shoot():
	var proj: Projectile = projectile_scene.instantiate()
	player.get_parent().add_child(proj)
	proj.global_position = player.global_position
	proj.velocity = Vector2.from_angle(player.rotation - PI / 2) * SHOOT_VELOCITY
	start()
