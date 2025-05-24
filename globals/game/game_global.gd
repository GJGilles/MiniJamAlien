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

enum SPORE_TYPE {
	BLUE,
	GREEN,
	ORANGE,
	PURPLE,
	RED,
	YELLOW
}

var money: int = 0

func get_food_texture(food: FOOD_TYPE) -> Texture2D:
	match food:
		FOOD_TYPE.GREEN:
			return load("res://assets/food/green.png")
		FOOD_TYPE.BLUE:
			return load("res://assets/food/blue.png")
		FOOD_TYPE.PURPLE:
			return load("res://assets/food/purple.png")
		_:
			return null

func get_room_texture(activity: ACTIVITY_TYPE) -> Texture2D:
	match activity:
		_:
			return null

func get_spore_texture(spore: SPORE_TYPE) -> Texture2D:
	match spore:
		SPORE_TYPE.BLUE:
			return load("res://assets/alien/blue.png")
		SPORE_TYPE.GREEN:
			return load("res://assets/alien/green.png")
		SPORE_TYPE.ORANGE:
			return load("res://assets/alien/orange.png")
		SPORE_TYPE.PURPLE:
			return load("res://assets/alien/purple.png")
		SPORE_TYPE.RED:
			return load("res://assets/alien/red.png")
		SPORE_TYPE.YELLOW:
			return load("res://assets/alien/yellow.png")
		_:
			return null
