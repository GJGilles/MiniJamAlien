extends CarryData

class_name CarryFoodData

var food: GAME.FOOD_TYPE

static func create(f: GAME.FOOD_TYPE) -> CarryFoodData:
	var data: CarryFoodData = new()
	data.food = f
	return data
