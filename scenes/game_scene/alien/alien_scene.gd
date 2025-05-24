extends Node2D

class_name AlienScene

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var progress_bar: ProgressBar = $ProgressBar

@onready var thought: TextureRect = $Thought
@onready var want: TextureRect = $Thought/Want

var data: AlienData:
	get: 
		return data
	set(value):
		if !is_ready:
			await ready
		
		visible = false
		if data != null:
			data.on_update.disconnect(on_update)
			
		data = value
		
		if data != null:
			visible = true
			data.on_update.connect(on_update)
			sprite_2d.texture = data.get_sprite()

var is_ready: bool = false

func _ready() -> void:
	is_ready = true

func _physics_process(delta: float) -> void:
	if data == null:
		return
	
	data.time_food_want += delta
	#data.time_activity_want += delta

func on_update():
	progress_bar.value = data.happiness
	
	if data.curr_food_want == GAME.FOOD_TYPE.NONE:
		thought.visible = false
	else:
		thought.visible = true
		want.texture = GAME.get_food_texture(data.curr_food_want)
		
