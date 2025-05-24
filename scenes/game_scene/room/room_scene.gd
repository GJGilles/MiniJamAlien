extends Area2D

class_name RoomScene

const SPORE_SCENE: PackedScene = preload("res://scenes/game_scene/spore/spore_scene.tscn")

@onready var background: Sprite2D = $Background
@onready var alien_scene: AlienScene = $AlienScene
@onready var spores: Node2D = $Spores

@export var data: RoomData:
	get:
		return data
	set(value):
		data = value
		if data != null:
			data.on_update.connect(on_update)
			on_update()

var is_ready: bool = false

func _ready() -> void:
	is_ready = true

func on_update():
	if !is_ready:
		await ready
	
	visible = data.is_unlocked
	background.texture = GAME.get_room_texture(data.get_activity_type())
	alien_scene.data = data.alien

func deposit(carry: MOUSE.CarryData):
	if carry is MOUSE.CarryFoodData and alien_scene.data != null:
		if alien_scene.data.do_food_want(carry.food):
			data.try_add_spore()

func add_spore(data: SporeData):
	var spore: SporeScene = SPORE_SCENE.instantiate()
	spores.add_child(spore)
	spore.data = data

func suck_to(pos: Vector2, force: float):
	for child: SporeScene in spores.get_children():
		child.apply_central_force(force * (pos - child.global_position).normalized())
