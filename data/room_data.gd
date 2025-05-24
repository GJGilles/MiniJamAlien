extends Resource

class_name RoomData

const SPORE_LIMIT: int = 5

@export var is_unlocked: bool:
	get: 
		return is_unlocked
	set(value):
		is_unlocked = value
		on_update.emit()

@export var alien: AlienData:
	get:
		return alien
	set(value):
		alien = value
		on_update.emit()

@export var facility: FacilityData:
	get:
		return facility
	set(value):
		facility = value
		on_update.emit()

var _spores: Array[SporeData] = []

signal on_update()
signal on_spore_added(data: SporeData)

func get_activity_type() -> GAME.ACTIVITY_TYPE:
	if facility != null:
		return facility.type
	else:
		return GAME.ACTIVITY_TYPE.NONE

func try_add_spore():
	var roll: int = 1 + randi() % 100
	if alien != null and roll < alien.happiness and _spores.size() < SPORE_LIMIT:
		var spore: SporeData = alien.get_spore()
		_spores.append(spore)
		spore.on_delete.connect(func(): try_remove_spore(spore), CONNECT_ONE_SHOT)
		on_spore_added.emit(spore)

func try_remove_spore(spore: SporeData):
	_spores.erase(spore)
