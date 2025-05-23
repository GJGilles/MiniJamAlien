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

enum ALIEN_TYPE {
	BLUE,
	GREEN,
	ORANGE,
	PURPLE,
	RED,
	YELLOW
}

var money: int:
	get:
		return money
	set(value):
		money = value
		on_update.emit()

signal on_update()

func _ready() -> void:
	money = 10

func get_alien_texture(alien: ALIEN_TYPE) -> Texture2D:
	match alien:
		ALIEN_TYPE.BLUE:
			return load("res://assets/alien/blue.png")
		ALIEN_TYPE.GREEN:
			return load("res://assets/alien/green.png")
		ALIEN_TYPE.ORANGE:
			return load("res://assets/alien/orange.png")
		ALIEN_TYPE.PURPLE:
			return load("res://assets/alien/purple.png")
		ALIEN_TYPE.RED:
			return load("res://assets/alien/red.png")
		ALIEN_TYPE.YELLOW:
			return load("res://assets/alien/yellow.png")
		_:
			return null

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
			return load("res://assets/room/none.png")

func get_spore_texture(spore: ALIEN_TYPE) -> Texture2D:
	match spore:
		ALIEN_TYPE.BLUE:
			return load("res://assets/spore/blue.png")
		ALIEN_TYPE.GREEN:
			return load("res://assets/spore/green.png")
		ALIEN_TYPE.ORANGE:
			return load("res://assets/spore/orange.png")
		ALIEN_TYPE.PURPLE:
			return load("res://assets/spore/purple.png")
		ALIEN_TYPE.RED:
			return load("res://assets/spore/red.png")
		ALIEN_TYPE.YELLOW:
			return load("res://assets/spore/yellow.png")
		_:
			return null
