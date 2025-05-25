extends Node2D

class_name AlienScene

@onready var sprite_2d: Sprite2D = $Sprite2D

@onready var thought: Sprite2D = $Thought
@onready var want: Sprite2D = $Thought/Want

@onready var happiness: Sprite2D = $Happiness

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
			on_update()

var is_ready: bool = false

func _ready() -> void:
	is_ready = true

func _physics_process(delta: float) -> void:
	if data == null:
		return
	
	data.time_food_want += delta
	data.time_activity_want += delta

func on_update():
	if data.happiness <= 20:
		happiness.texture = load("res://assets/happiness/0.png")
	elif data.happiness <= 40:
		happiness.texture = load("res://assets/happiness/1.png")
	elif data.happiness <= 60:
		happiness.texture = load("res://assets/happiness/2.png")
	elif data.happiness <= 80:
		happiness.texture = load("res://assets/happiness/3.png")
	else:
		happiness.texture = load("res://assets/happiness/4.png")
	
	if data.curr_food_want == GAME.FOOD_TYPE.NONE:
		thought.visible = false
	else:
		thought.visible = true
		want.texture = GAME.get_food_texture(data.curr_food_want)
		
