extends AlienData

class_name AlienOrangeData

func _init():
	want_food = WantData.create({ 
		GAME.FOOD_TYPE.GREEN: 3,
		GAME.FOOD_TYPE.BLUE: 3 
	}, 24)
	want_activity = WantData.create({ GAME.ACTIVITY_TYPE.SPRAY: 15 }, 80)
	want_spore = WantData.create({ 
		GAME.ALIEN_TYPE.RED: 10, 
		GAME.ALIEN_TYPE.YELLOW: 10
	}, 75)
	super._init()

func get_sprite() -> Texture2D:
	if time_blush < BLUSH_TIMEOUT:
		return load("res://assets/alien/orange 2.png")
	elif happiness < 40:
		return load("res://assets/alien/orange 1.png")
	elif happiness < 80:
		return load("res://assets/alien/orange.png")
	else:
		return load("res://assets/alien/orange 3.png")

func get_spore() -> SporeData:
	return SporeData.create(GAME.ALIEN_TYPE.ORANGE, 5)
