extends Resource

class_name AlienData

const BLUSH_TIMEOUT: float = 0.5

var is_unlocked: bool = false:
	get:
		return is_unlocked
	set(value):
		is_unlocked = value
		on_update.emit()

var happiness: float = 0:
	get:
		return happiness
	set(value):
		if value > happiness:
			time_blush = 0
			on_happy.emit()
		
		happiness = clamp(value, 0, 100)
		want_food.happiness = happiness
		want_activity.happiness = happiness
		want_spore.happiness = happiness
		on_update.emit()

var time_blush: float = BLUSH_TIMEOUT:
	get:
		return time_blush
	set(value):
		if time_blush < BLUSH_TIMEOUT or value < BLUSH_TIMEOUT:
			time_blush = value
			if time_blush > BLUSH_TIMEOUT:
				on_update.emit()

var want_food: WantData = WantData.new()
var want_activity: WantData = WantData.new()
var want_spore: WantData = WantData.new()

signal on_update()
signal on_happy()

func _init():
	GAME.on_tick.connect(on_tick)
	
	want_food.on_update.connect(on_update.emit)
	want_activity.on_update.connect(on_update.emit)
	want_spore.on_update.connect(on_update.emit)
	
	want_food.on_happy.connect(func(p: float): happiness += p)
	want_activity.on_happy.connect(func(p: float): happiness += p)
	want_spore.on_happy.connect(func(p: float): happiness += p)

func on_tick(delta: float):
	if is_unlocked:
		time_blush += delta
		
		want_food.on_tick(delta)
		want_activity.on_tick(delta)
		want_spore.on_tick(delta)
		

func get_sprite() -> Texture2D:
	return null

func get_spore() -> SporeData:
	return null
	
func do_food_want(food: GAME.FOOD_TYPE):
	want_food.do_want(food)

func do_activity_want(activity: GAME.ACTIVITY_TYPE):
	want_activity.do_want(activity)

func do_pet():
	happiness += 0.05
