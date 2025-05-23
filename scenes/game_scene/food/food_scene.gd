extends Control

@onready var texture_rect: TextureRect = $TextureButton/TextureRect

@export var food: AlienData.FOOD_TYPE

func _ready() -> void:
	texture_rect.texture = get_texture()

func _button_down() -> void:
	MOUSE.curr_carry = MOUSE.CarryFoodData.create(get_texture(), food)

func get_texture() -> Texture2D:
	match food:
		AlienData.FOOD_TYPE.GREEN:
			return preload("res://assets/food/green.png")
		AlienData.FOOD_TYPE.BLUE:
			return preload("res://assets/food/blue.png")
		AlienData.FOOD_TYPE.PURPLE:
			return preload("res://assets/food/purple.png")
		_:
			return null
