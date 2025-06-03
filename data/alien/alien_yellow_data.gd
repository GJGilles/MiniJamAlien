extends AlienData

class_name AlienYellowData

func _init():
	want_food = WantData.create({ GAME.FOOD_TYPE.PURPLE: 5 }, 33)
	want_activity = WantData.create({ GAME.ACTIVITY_TYPE.SPIN: 10 }, 53)
	super._init()

func get_sprite() -> Texture2D:
	if time_blush < BLUSH_TIMEOUT:
		return load("res://assets/alien/yellow 2.png")
	elif happiness < 40:
		return load("res://assets/alien/yellow 1.png")
	elif happiness < 80:
		return load("res://assets/alien/yellow.png")
	else:
		return load("res://assets/alien/yellow 3.png")

func get_spore() -> SporeData:
	return SporeData.create(GAME.ALIEN_TYPE.YELLOW, 1)
