extends Node

enum FOOD_TYPE {
	NONE,
	
	GREEN,
	BLUE,
	PURPLE
}

enum ACTIVITY_TYPE {
	NONE,
	
	SPRAY,
	POKE,
	SPIN
}

var money: int = 0

func get_food_texture(food: FOOD_TYPE) -> Texture2D:
	match food:
		FOOD_TYPE.GREEN:
			return preload("res://assets/food/green.png")
		FOOD_TYPE.BLUE:
			return preload("res://assets/food/blue.png")
		FOOD_TYPE.PURPLE:
			return preload("res://assets/food/purple.png")
		_:
			return null
