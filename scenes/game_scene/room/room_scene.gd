extends Area2D

class_name RoomScene

const SPORE_SCENE: PackedScene = preload("res://scenes/game_scene/spore/spore_scene.tscn")

#@onready var item_player: AnimationPlayer = $Background/ItemPlayer

@onready var background: Sprite2D = $Background
@onready var item: Sprite2D = $Background/Item
@onready var alien_scene: AlienScene = $AlienScene
@onready var spores: Node2D = $Spores

@export var data: RoomData:
	get:
		return data
	set(value):
		data = value
		if data != null:
			data.on_update.connect(on_update)
			data.on_spore_added.connect(add_spore)
			on_update()

var is_ready: bool = false

func _ready() -> void:
	is_ready = true
	alien_movement()

func is_item_active() -> bool:
	return data.alien != null and data.facility != null and data.alien.want_activity.curr_want == data.facility.type

func on_update():
	if !is_ready:
		await ready
	
	visible = data.is_unlocked
	background.texture = GAME.get_room_texture(data.get_activity_type())
	item.texture = GAME.get_item_texture(data.get_activity_type())
	alien_scene.data = data.alien
	
	#if is_item_active():
		#item_player.play("item_active")
	#else:
		#item_player.play("RESET")

func alien_movement():
	var tween = create_tween()
	tween.tween_property(alien_scene, "position", Vector2(randi_range(-50, 50), randi_range(-80, 20)), 3.0)
	tween.finished.connect(alien_movement, CONNECT_ONE_SHOT)

func deposit(carry: CarryData, from: RoomScene):
	if carry is CarryFoodData:
		if data.alien != null: 
			data.alien.do_food_want(carry.food)
	elif carry is CarryAlienData:
		if data.alien != null and from != null:
			from.data.alien = data.alien
		data.alien = carry.alien

func pickup() -> CarryData:
	if is_item_active():
		MINIGAME.start(data)
		return null
	elif data.is_unlocked and data.alien != null:
		var carry: CarryData = CarryAlienData.create(data.alien)
		data.alien = null
		return carry
	else:
		return null

func add_spore(spore_data: SporeData):
	var spore: SporeScene = SPORE_SCENE.instantiate()
	spores.add_child(spore)
	spore.scale = spores.scale
	spore.data = spore_data

func suck_to(pos: Vector2, force: float):
	for child: SporeScene in spores.get_children():
		child.apply_central_force(force * (pos - child.global_position).normalized())
