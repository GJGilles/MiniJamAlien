extends AlienData

class_name AlienPurpleData

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

func get_food_wants() -> Dictionary[GAME.FOOD_TYPE, int]:
	return {
		GAME.FOOD_TYPE.GREEN: 3,
		GAME.FOOD_TYPE.PURPLE: 3
	}

func get_activity_wants() -> Dictionary[GAME.ACTIVITY_TYPE, int]:
	return {
		GAME.ACTIVITY_TYPE.SPRAY: 15
	}

func get_food_cooldown() -> float:
	return 20.0

func get_activity_cooldown() -> float:
	return 27
