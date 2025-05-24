extends Resource

class_name AlienData

const FOOD_WANT_TIMEOUT: float = 5
const ACTIVITY_WANT_TIMEOUT: float = 10

var happiness: int:
	get:
		return happiness
	set(value):
		happiness = clamp(value, 0, 100)
		on_update.emit()

var curr_food_want: GAME.FOOD_TYPE:
	get:
		return curr_food_want
	set(value):
		curr_food_want = value
		on_update.emit()
		
var curr_activity_want: GAME.ACTIVITY_TYPE:
	get:
		return curr_activity_want
	set(value):
		curr_activity_want = value
		on_update.emit()

var time_food_want: float:
	get:
		return time_food_want
	set(value):
		if curr_food_want != GAME.FOOD_TYPE.NONE:
			if value > FOOD_WANT_TIMEOUT:
				happiness -= get_food_wants()[curr_food_want]
				curr_food_want = GAME.FOOD_TYPE.NONE
				time_food_want = 0
			else:
				time_food_want = value
		elif value > get_food_cooldown() and get_food_wants().size() > 0:
			var idx: int = randi() % get_food_wants().keys().size()
			curr_food_want = get_food_wants().keys()[idx]
			time_food_want = 0
		else:
			time_food_want = value

var time_activity_want: float:
	get:
		return time_activity_want
	set(value):
		if curr_activity_want != GAME.ACTIVITY_TYPE.NONE:
			if value > ACTIVITY_WANT_TIMEOUT:
				happiness -= get_activity_wants()[curr_activity_want]
				curr_activity_want = GAME.ACTIVITY_TYPE.NONE
				time_activity_want = 0
			else:
				time_activity_want = value
		elif value > get_activity_cooldown() and get_activity_wants().size() > 0:
			var idx: int = randi() % get_activity_wants().keys().size()
			curr_activity_want = get_activity_wants().keys()[idx]
			time_activity_want = 0
		else:
			time_activity_want = value

signal on_update()

func _init():
	happiness = 20
	
	time_food_want = 10
	time_activity_want = 0
	
	curr_food_want = GAME.FOOD_TYPE.NONE
	curr_activity_want = GAME.ACTIVITY_TYPE.NONE

func get_sprite() -> Texture2D:
	return null

func get_spore() -> SporeData:
	return null

func get_food_wants() -> Dictionary[GAME.FOOD_TYPE, int]:
	return {}

func get_activity_wants() -> Dictionary[GAME.ACTIVITY_TYPE, int]:
	return {}

func get_food_cooldown() -> float:
	return 3.0

func get_activity_cooldown() -> float:
	return 8.0
	
func do_food_want(food: GAME.FOOD_TYPE) -> bool:
	if curr_food_want == food:
		happiness += get_food_wants()[curr_food_want]
		curr_food_want = GAME.FOOD_TYPE.NONE
		time_food_want = 0
		return true
	else:
		return false

func do_activity_want(activity: GAME.ACTIVITY_TYPE):
	if curr_activity_want == activity:
		happiness += get_activity_wants()[curr_activity_want]
		curr_activity_want = GAME.ACTIVITY_TYPE.NONE
		time_activity_want = 0
