extends AlienData

class_name AlienOrangeData

func get_sprite() -> Texture2D:
	return load("res://assets/alien/orange.png")

func get_spore() -> SporeData:
	return SporeData.create(GAME.ALIEN_TYPE.ORANGE, 5)

func get_food_wants() -> Dictionary[GAME.FOOD_TYPE, int]:
	return {
		GAME.FOOD_TYPE.GREEN: 3,
		GAME.FOOD_TYPE.BLUE: 3
	}

func get_activity_wants() -> Dictionary[GAME.ACTIVITY_TYPE, int]:
	return {
		GAME.ACTIVITY_TYPE.SPRAY: 20
	}

func get_food_cooldown() -> float:
	return 24.0

func get_activity_cooldown() -> float:
	return 8.0
