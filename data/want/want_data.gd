extends Resource

class_name WantData

var curr_want: int = -1
var want_dict: Dictionary[int, float] = {}

var timer: float = 0.0
var happiness: float = 0.0
var cooldown: float = 1.0:
	get:
		return cooldown * (1 + happiness / 100.0)

signal on_update()
signal on_happy(points: float)

static func create(wants: Dictionary[int, float], cool: float) -> WantData:
	var data: WantData = WantData.new()
	data.want_dict = wants
	data.cooldown = cool
	return data

func is_want() -> bool:
	return curr_want >= 0

func on_tick(delta: float):
	if timer < cooldown:
		timer += delta
		if not is_want() and timer > cooldown and want_dict.size() > 0:
			var idx: int = randi() % want_dict.keys().size()
			curr_want = want_dict.keys()[idx]
			on_update.emit()

func do_want(want: int):
	if curr_want == want:
		on_happy.emit(want_dict[want])
		curr_want = -1
		timer = 0
		on_update.emit()
