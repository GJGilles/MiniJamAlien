extends AlienData

class_name AlienPurpleData

func _init():
	want_food = WantData.create({ 
		GAME.FOOD_TYPE.GREEN: 3,
		GAME.FOOD_TYPE.PURPLE: 3
	}, 20)
	want_activity = WantData.create({ GAME.ACTIVITY_TYPE.SPRAY: 15 }, 27)
	want_spore = WantData.create({ 
		GAME.ALIEN_TYPE.RED: 10, 
		GAME.ALIEN_TYPE.BLUE: 10
	}, 69)
	super._init()

func get_sprite() -> Texture2D:
	if time_blush < BLUSH_TIMEOUT:
		return load("res://assets/alien/pink 2.png")
	elif happiness < 40:
		return load("res://assets/alien/pink 1.png")
	elif happiness < 80:
		return load("res://assets/alien/pink.png")
	else:
		return load("res://assets/alien/pink 3.png")

func get_spore() -> SporeData:
	return SporeData.create(GAME.ALIEN_TYPE.PURPLE, 5)
