extends AlienData

class_name AlienGreenData

func _init():
	want_food = WantData.create({ 
		GAME.FOOD_TYPE.GREEN: 2,
		GAME.FOOD_TYPE.BLUE: 2,
		GAME.FOOD_TYPE.PURPLE: 2 
	}, 45)
	want_activity = WantData.create({ 
		GAME.ACTIVITY_TYPE.SPIN: 5,
		GAME.ACTIVITY_TYPE.SPRAY: 5 
	}, 99)
	want_spore = WantData.create({ 
		GAME.ALIEN_TYPE.PURPLE: 8, 
		GAME.ALIEN_TYPE.GREEN: 8
	}, 55)
	super._init()

func get_sprite() -> Texture2D:
	if time_blush < BLUSH_TIMEOUT:
		return load("res://assets/alien/green 2.png")
	elif happiness < 40:
		return load("res://assets/alien/green 1.png")
	elif happiness < 80:
		return load("res://assets/alien/green.png")
	else:
		return load("res://assets/alien/green 3.png")

func get_spore() -> SporeData:
	return SporeData.create(GAME.ALIEN_TYPE.GREEN, 8)
