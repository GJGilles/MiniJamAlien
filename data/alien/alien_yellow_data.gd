extends AlienData

class_name AlienYellowData

func get_sprite() -> Texture2D:
	return load("res://assets/alien/yellow.png")

func get_spore() -> SporeData:
	return SporeData.create(GAME.ALIEN_TYPE.YELLOW, 1)

func get_food_wants() -> Dictionary[GAME.FOOD_TYPE, int]:
	return {
		GAME.FOOD_TYPE.PURPLE: 5
	}

func get_activity_wants() -> Dictionary[GAME.ACTIVITY_TYPE, int]:
	return {
		GAME.ACTIVITY_TYPE.SPRAY: 20
	}

func get_food_cooldown() -> float:
	return 33.0

func get_activity_cooldown() -> float:
	return 8.0
