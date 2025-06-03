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
		if value < money:
			on_sell.emit()
		money = value
		on_update.emit()

var is_room_paused: bool = false;

signal on_tick(delta: float)
signal on_update()
signal on_sell()

func _ready() -> void:
	money = 5

func _physics_process(delta):
	on_tick.emit(delta)

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

func get_item_texture(activity: ACTIVITY_TYPE) -> Texture2D:
	match activity:
		ACTIVITY_TYPE.SPRAY:
			return load("res://assets/item/spray.png")
		ACTIVITY_TYPE.POKE:
			return load("res://assets/item/poke.png")
		ACTIVITY_TYPE.SPIN:
			return load("res://assets/item/spin.png")
		_:
			return null

func get_room_texture(activity: ACTIVITY_TYPE) -> Texture2D:
	match activity:
		ACTIVITY_TYPE.SPRAY:
			return load("res://assets/room/spray.png")
		ACTIVITY_TYPE.POKE:
			return load("res://assets/room/poke.png")
		ACTIVITY_TYPE.SPIN:
			return load("res://assets/room/spin.png")
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
