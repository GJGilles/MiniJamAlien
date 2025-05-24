extends RigidBody2D

class_name SporeScene

@onready var sprite_2d: Sprite2D = $Sprite2D

const FORCE: float = 200.0
const INTERVAL: float = 2.0

var interval_time: float = 0

var sprite: Texture2D = null
var cost: int = 1

func _ready() -> void:
	sprite_2d.texture = sprite
	position = Vector2.ZERO

func set_values(s: Texture2D, c: int):
	sprite = s
	cost = c

func _physics_process(delta: float) -> void:
	interval_time += delta
	
	if interval_time > INTERVAL:
		interval_time = 0
		apply_central_force(FORCE * Vector2(2 * randf() - 1, 2 * randf() - 1))
