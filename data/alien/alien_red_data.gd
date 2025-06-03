extends AlienData

class_name AlienRedData

func _init():
	want_food = WantData.create({ GAME.FOOD_TYPE.GREEN: 5 }, 35)
	want_activity = WantData.create({ GAME.ACTIVITY_TYPE.SPIN: 10 }, 42)
	super._init()

func get_sprite() -> Texture2D:
	if time_blush < BLUSH_TIMEOUT:
		return load("res://assets/alien/red 2.png")
	elif happiness < 40:
		return load("res://assets/alien/red 1.png")
	elif happiness < 80:
		return load("res://assets/alien/red.png")
	else:
		return load("res://assets/alien/red 3.png")

func get_spore() -> SporeData:
	return SporeData.create(GAME.ALIEN_TYPE.RED, 1)
