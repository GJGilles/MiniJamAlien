extends Node2D

enum MOUSE_MODE {
	CARRY,
	SUCK,
	INTERACT,
	SELL
}

class CarryData:
	var sprite: Texture2D

class CarryFoodData extends CarryData:
	var food: GAME.FOOD_TYPE
	
	static func create(s: Texture2D, f: GAME.FOOD_TYPE) -> CarryFoodData:
		var data: CarryData = new()
		data.sprite = s
		data.food = f
		return data
		

@onready var sprite_2d: Sprite2D = $Sprite2D

const SUCK_FORCE: float = 1000

var mode: MOUSE_MODE:
	get:
		return mode
	set(value):
		curr_carry = null
		mode = value

var curr_carry: CarryData:
	get:
		return curr_carry
	set(value):
		if mode == MOUSE_MODE.CARRY:
			curr_carry = value
			if value != null:
				sprite_2d.texture = curr_carry.sprite
			else:
				sprite_2d.texture = null

var curr_target: RoomScene

func _ready() -> void:
	mode = MOUSE_MODE.CARRY

func _physics_process(delta: float) -> void:
	if mode == MOUSE_MODE.SUCK and Input.is_mouse_button_pressed(MouseButton.MOUSE_BUTTON_LEFT) and curr_target != null:
		curr_target.suck_to(global_position, SUCK_FORCE)

func _input(event: InputEvent) -> void:
	match mode: 
		MOUSE_MODE.CARRY:
			if event is InputEventMouseMotion:
				position = (event.position - get_canvas_transform().origin) / get_canvas_transform().get_scale()
			elif event is InputEventMouseButton:
				if event.button_index == MouseButton.MOUSE_BUTTON_LEFT and not event.pressed:
					if curr_target != null and curr_carry != null:
						curr_target.deposit(curr_carry)
					curr_carry = null
		MOUSE_MODE.SUCK:
			if event is InputEventMouseMotion:
				position = (event.position - get_canvas_transform().origin) / get_canvas_transform().get_scale()

func _area_entered(area: Area2D) -> void:
	if area is RoomScene:
		curr_target = area

func _area_exited(area: Area2D) -> void:
	if area == curr_target:
		curr_target = null

func _body_entered(body: Node2D) -> void:
	if body is SporeScene and mode == MOUSE_MODE.SUCK and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var spore: SporeScene = body
		GAME.money += spore.cost
		body.queue_free()
