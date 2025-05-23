extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var progress_bar: ProgressBar = $Sprite2D/ProgressBar

@export var data: AlienData:
	get: 
		return data
	set(value):
		if data != null:
			sprite_2d.visible = false
			data.on_update.disconnect(on_update)
			
		data = value
		if !is_ready:
			await ready
		
		if data != null:
			sprite_2d.visible = true
			data.on_update.connect(on_update)
			sprite_2d.texture = data.get_sprite()

var is_ready: bool = false

func _ready() -> void:
	is_ready = true

func _physics_process(delta: float) -> void:
	if data == null:
		return
	
	data.time_food_want += delta
	data.time_activity_want += delta

func on_update():
	progress_bar.value = data.happiness
