extends AlienData

class_name AlienBlueData

func _init():
	want_food = WantData.create({ GAME.FOOD_TYPE.BLUE: 5 }, 19)
	want_activity = WantData.create({ GAME.ACTIVITY_TYPE.SPIN: 10 }, 26)
	super._init()
	

func get_sprite() -> Texture2D:
	if time_blush < BLUSH_TIMEOUT:
		return load("res://assets/alien/blue 2.png")
	elif happiness < 40:
		return load("res://assets/alien/blue 1.png")
	elif happiness < 80:
		return load("res://assets/alien/blue.png")
	else:
		return load("res://assets/alien/blue 3.png")

func get_spore() -> SporeData:
	return SporeData.create(GAME.ALIEN_TYPE.BLUE, 1)
