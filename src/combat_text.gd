class_name CombatText
extends Node2D

static var instance: CombatText
static var font = SystemFont.new()

var damage_numbers: Array = []

func _ready() -> void:
	instance = self

func _process(delta: float) -> void:
	if damage_numbers.is_empty():
		return
	
	for x in damage_numbers:
		x.life -= delta
		x.pos += DamageNumber.VELOCITY * delta
	damage_numbers = damage_numbers.filter(func(x): return x.life > 0.0)
	queue_redraw()

func _draw() -> void:
	for x in damage_numbers:
		draw_string(font, x.pos, str(x.number), 0, -1, 16, modulate.lerp(Color.TRANSPARENT, 1.0 - x.life))

func damage_number(pos: Vector2, number: float):
	var element = DamageNumber.new()
	element.pos = pos - global_position
	element.number = number
	damage_numbers.push_back(element)

class DamageNumber:
	const VELOCITY = Vector2.UP * 60
	var life: float = 1
	var pos: Vector2
	var number: float
