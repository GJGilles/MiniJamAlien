extends Node2D

enum MOUSE_MODE {
	CARRY,
	INTERACT,
	SELL
}

class CarryData:
	var sprite: Texture2D

class CarryFoodData extends CarryData:
	var food: AlienData.FOOD_TYPE
	
	static func create(s: Texture2D, f: AlienData.FOOD_TYPE) -> CarryFoodData:
		var data: CarryData = new()
		data.sprite = s
		data.food = f
		return data
		

@onready var sprite_2d: Sprite2D = $Sprite2D

var curr_carry: CarryData:
	get:
		return curr_carry
	set(value):
		curr_carry = value
		if value != null:
			sprite_2d.texture = curr_carry.sprite
		else:
			sprite_2d.texture = null

var curr_target: RoomScene

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		position = event.position - get_canvas_transform().origin
	elif event is InputEventMouseButton:
		if event.button_index == MouseButton.MOUSE_BUTTON_LEFT and not event.pressed:
			if curr_target != null and curr_carry != null:
				curr_target.deposit(curr_carry)
			curr_carry = null

func _area_entered(area: Area2D) -> void:
	if area is RoomScene:
		curr_target = area

func _area_exited(area: Area2D) -> void:
	if area == curr_target:
		curr_target = null
