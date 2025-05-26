extends AlienData

class_name AlienYellowData

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

func get_food_wants() -> Dictionary[GAME.FOOD_TYPE, int]:
	return {
		GAME.FOOD_TYPE.PURPLE: 5
	}

func get_activity_wants() -> Dictionary[GAME.ACTIVITY_TYPE, int]:
	return {
		GAME.ACTIVITY_TYPE.SPIN: 10
	}

func get_food_cooldown() -> float:
	return 33.0

func get_activity_cooldown() -> float:
	return 53
