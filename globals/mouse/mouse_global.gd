extends Node2D

enum MOUSE_MODE {
	CARRY,
	PET,
	SUCK,
}

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var alien_scene: AlienScene = $AlienScene
@onready var audio = $AudioStreamPlayer

const SUCK_FORCE: float = 100

var mode: MOUSE_MODE:
	get:
		return mode
	set(value):
		curr_carry = null
		mode = value
		match mode:
			MOUSE_MODE.CARRY:
				sprite_2d.texture = null
			MOUSE_MODE.SUCK:
				sprite_2d.texture = load("res://assets/mouse/suck_off.png")
			MOUSE_MODE.PET:
				sprite_2d.texture = load("res://assets/mouse/pet_up.png")

var curr_carry: CarryData:
	get:
		return curr_carry
	set(value):
		if mode == MOUSE_MODE.CARRY:
			curr_carry = value
			if value != null:
				if value is CarryFoodData:
					sprite_2d.texture = GAME.get_food_texture(value.food)
				elif value is CarryAlienData:
					alien_scene.data = value.alien
					
			else:
				sprite_2d.texture = null
				alien_scene.data = null

var curr_target: RoomScene
var curr_source: RoomScene

func _ready() -> void:
	mode = MOUSE_MODE.CARRY

func _physics_process(_delta: float) -> void:
	if mode == MOUSE_MODE.SUCK and Input.is_action_pressed("tool_use") and curr_target != null:
		curr_target.suck_to(global_position, SUCK_FORCE)

func _input(event: InputEvent) -> void:
	if MINIGAME.is_active:
		return
	
	if event is InputEventMouseMotion:
		position = (event.position - get_canvas_transform().origin) / get_canvas_transform().get_scale()
	elif event.is_action("tool_use"):
		match mode: 
			MOUSE_MODE.CARRY:
				if event.pressed and curr_carry == null and curr_target != null:
					curr_carry = curr_target.pickup()
					curr_source = curr_target
				elif not event.pressed and curr_carry != null:
					if curr_target != null and curr_target.data.is_unlocked:
						curr_target.deposit(curr_carry, curr_source)
					elif curr_carry is CarryAlienData:
						curr_source.deposit(curr_carry, null)
					curr_carry = null
			
			MOUSE_MODE.PET:
				if event.pressed:
					sprite_2d.texture = load("res://assets/mouse/pet_down.png")
					if curr_target != null and curr_target.data.alien != null:
						curr_target.data.alien.do_pet()
				else:
					sprite_2d.texture = load("res://assets/mouse/pet_up.png")
			
			MOUSE_MODE.SUCK:
				if event.pressed:
					sprite_2d.texture = load("res://assets/mouse/suck_on.png")
				else:
					sprite_2d.texture = load("res://assets/mouse/suck_off.png")
			
	elif event.is_action("tool_toggle") and event.is_pressed():
		match mode: 
			MOUSE_MODE.CARRY:
				mode = MOUSE_MODE.PET
			MOUSE_MODE.PET:
				mode = MOUSE_MODE.SUCK
			MOUSE_MODE.SUCK:
				mode = MOUSE_MODE.CARRY

func _area_entered(area: Area2D) -> void:
	if area is RoomScene:
		curr_target = area

func _area_exited(area: Area2D) -> void:
	if area == curr_target:
		curr_target = null

func _body_entered(body: Node2D) -> void:
	if body is SporeScene and mode == MOUSE_MODE.SUCK and Input.is_action_pressed("tool_use"):
		var spore: SporeScene = body
		GAME.money += spore.data.value
		spore.data.delete()
		audio.play()
