extends RigidBody2D

class_name SporeScene

@onready var sprite_2d: Sprite2D = $Sprite2D

const FORCE: float = 200.0
const INTERVAL: float = 2.0

var interval_time: float = 0

var data: SporeData:
	get:
		return data
	set(value):
		data = value
		if data != null:
			sprite_2d.texture = GAME.get_spore_texture(data.type)
			data.on_delete.connect(delete)

func _ready() -> void:
	position = Vector2.ZERO

func _physics_process(delta: float) -> void:
	interval_time += delta
	
	if interval_time > INTERVAL:
		interval_time = 0
		apply_central_force(FORCE * Vector2(2 * randf() - 1, 2 * randf() - 1))

func delete():
	get_parent().remove_child(self)
	queue_free()
