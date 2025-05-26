extends Control

@onready var texture_rect: TextureRect = $TextureButton/TextureRect

@export var food: GAME.FOOD_TYPE

func _ready() -> void:
	texture_rect.texture = GAME.get_food_texture(food)

func _button_down() -> void:
	MOUSE.mode = MOUSE.MOUSE_MODE.CARRY
	MOUSE.curr_carry = CarryFoodData.create(food)
