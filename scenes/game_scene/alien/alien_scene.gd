extends Node2D

class_name AlienScene

@onready var sprite_2d: Sprite2D = $Sprite2D

@onready var thought: Sprite2D = $Thought
@onready var want: Sprite2D = $Thought/Want

@onready var happiness: Sprite2D = $Happiness
@onready var particles: CPUParticles2D = $Particles

const PARTICLE_TIMEOUT: float = 1.0

var particle_time: float = 1.0

var data: AlienData:
	get: 
		return data
	set(value):
		if !is_ready:
			await ready
		
		visible = false
		if data != null:
			data.on_update.disconnect(on_update)
			data.on_happy.disconnect(on_happy)
			
		data = value
		
		if data != null:
			visible = true
			data.on_update.connect(on_update)
			data.on_happy.connect(on_happy)
			on_update()

var is_ready: bool = false

func _ready() -> void:
	is_ready = true

func _physics_process(delta: float) -> void:
	if data == null:
		return
	
	data.time_food_want += delta
	data.time_activity_want += delta
	data.time_blush += delta
	
	particle_time += delta
	if particle_time > PARTICLE_TIMEOUT:
		particles.emitting = false

func on_update():
	sprite_2d.texture = data.get_sprite()
	
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
	
	if data.curr_food_want != GAME.FOOD_TYPE.NONE:
		thought.visible = true
		want.texture = GAME.get_food_texture(data.curr_food_want)
		want.scale = Vector2(2, 2)
	elif data.curr_activity_want != GAME.ACTIVITY_TYPE.NONE:
		thought.visible = true
		want.texture = GAME.get_item_texture(data.curr_activity_want)
		want.scale = Vector2(0.75, 0.75)
	else:
		thought.visible = false

func on_happy():
	particles.emitting = true
	particle_time = 0
