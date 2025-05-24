extends AlienData

class_name AlienGreenData

func get_sprite() -> Texture2D:
	return load("res://assets/alien/green.png")

func get_spore() -> SporeData:
	return SporeData.create(GAME.ALIEN_TYPE.GREEN, 8)

func get_food_wants() -> Dictionary[GAME.FOOD_TYPE, int]:
	return {
		GAME.FOOD_TYPE.GREEN: 2,
		GAME.FOOD_TYPE.BLUE: 2,
		GAME.FOOD_TYPE.PURPLE: 2
	}

func get_activity_wants() -> Dictionary[GAME.ACTIVITY_TYPE, int]:
	return {
		GAME.ACTIVITY_TYPE.SPRAY: 20
	}

func get_food_cooldown() -> float:
	return 30.0

func get_activity_cooldown() -> float:
	return 8.0
