extends Resource

class_name SporeData

var type: GAME.SPORE_TYPE
var value: int = 1

signal on_delete()

static func create(t: GAME.SPORE_TYPE, v: int) -> SporeData:
	var spore: SporeData = SporeData.new()
	spore.type = t
	spore.value = v
	return spore

func delete():
	on_delete.emit()
