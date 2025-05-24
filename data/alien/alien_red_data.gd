extends AlienData

class_name AlienRedData

func get_sprite() -> Texture2D:
	return load("res://assets/alien/red.png")

func get_food_wants() -> Dictionary[GAME.FOOD_TYPE, int]:
	return {
		GAME.FOOD_TYPE.GREEN: 5
	}

func get_activity_wants() -> Dictionary[GAME.ACTIVITY_TYPE, int]:
	return {
		GAME.ACTIVITY_TYPE.SPRAY: 20
	}

func get_food_cooldown() -> float:
	return 3.0

func get_activity_cooldown() -> float:
	return 8.0
