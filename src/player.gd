extends CharacterBody2D

const SPEED = 300.0

const SHOOT_INVERVAL: float = 0.2
@export
var projectile_scene: PackedScene
var shoot_timer: float = SHOOT_INVERVAL
const SHOOT_VELOCITY: float = 600

func _process(delta: float) -> void:
	if Input.is_action_pressed("shoot") && can_shoot():
		shoot()
		shoot_timer = 0

func _physics_process(delta: float) -> void:
	shoot_timer += delta
	
	var vy := Input.get_axis("up", "down") 
	var vx := Input.get_axis("left", "right")
	velocity = Vector2(vx, vy) * SPEED
	move_and_slide()
	
	if velocity.length() > 0:
		rotation = velocity.angle() + PI / 2

func can_shoot() -> bool:
	return shoot_timer >= SHOOT_INVERVAL
func shoot():
	var proj: Projectile = projectile_scene.instantiate()
	proj.global_position = global_position
	proj.velocity = Vector2.from_angle(rotation - PI / 2) * SHOOT_VELOCITY
	get_parent().add_child(proj)
