extends Resource

class_name FacilityData

var type: GAME.ACTIVITY_TYPE

static func create(t: GAME.ACTIVITY_TYPE) -> FacilityData:
	var data: FacilityData = FacilityData.new()
	data.type = t
	return data
