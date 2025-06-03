extends Resource

class_name RoomData

const SPORE_LIMIT: int = 10

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
		if alien != null:
			alien.on_happy.disconnect(try_add_spore)
		
		alien = value
		if alien != null:
			alien.on_happy.connect(try_add_spore)
		
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

func _init():
	GAME.on_tick.connect(on_tick)

func on_tick(_delta):
	if alien != null and alien.want_spore.is_want():
		var type: int = alien.want_spore.curr_want
		var idx: int = _spores.find_custom(func(s: SporeData): return s.type == type)
		if idx >= 0:
			_spores[idx].delete()
			alien.want_spore.do_want(type)

func get_activity_type() -> GAME.ACTIVITY_TYPE:
	if facility != null:
		return facility.type
	else:
		return GAME.ACTIVITY_TYPE.NONE

func try_add_spore():
	var roll: int = randi_range(0, 200)
	if alien != null and roll < alien.happiness and _spores.size() < SPORE_LIMIT:
		var spore: SporeData = alien.get_spore()
		_spores.append(spore)
		spore.on_delete.connect(func(): try_remove_spore(spore), CONNECT_ONE_SHOT)
		on_spore_added.emit(spore)

func try_remove_spore(spore: SporeData):
	_spores.erase(spore)
