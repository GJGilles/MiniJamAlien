extends CarryData

class_name CarryAlienData 

var alien: AlienData

static func create(a: AlienData) -> CarryAlienData:
	var data: CarryAlienData = new()
	data.alien = a
	return data
