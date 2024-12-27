extends VBoxContainer

@export
var upgrade_point_texture: Texture2D

func _ready() -> void:
	for i in UserData.attack:
		add_upgrade_point_textrect($Attack)

func add_upgrade_point_textrect(node: Control):
	var text_rect = TextureRect.new()
	text_rect.texture = upgrade_point_texture
	node.add_child(text_rect)


func upgrade_attack():
	UserData.attack += 1
	UserData.upgrade_points -= 1

func can_upgrade():
	return UserData.upgrade_points > 0

func _on_attack_upgrade_area_entered(area: Area2D) -> void:
	if area is Projectile:
		upgrade_attack()
