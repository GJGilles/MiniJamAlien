extends AlienData

class_name AlienBlueData

func get_sprite() -> Texture2D:
	return load("res://assets/alien/blue.png")

func get_spore() -> SporeData:
	return SporeData.create(GAME.ALIEN_TYPE.BLUE, 1)

func get_food_wants() -> Dictionary[GAME.FOOD_TYPE, int]:
	return {
		GAME.FOOD_TYPE.BLUE: 5
	}

func get_activity_wants() -> Dictionary[GAME.ACTIVITY_TYPE, int]:
	return {
		GAME.ACTIVITY_TYPE.SPIN: 20
	}

func get_food_cooldown() -> float:
	return 19

func get_activity_cooldown() -> float:
	return 8.0
