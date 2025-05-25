extends ActivityScene

const MAX_SPEED: float = 15
const SPEED_BOOST: float = 5
const SPEED_DECAY: float = 15
const LINEAR_SPEED_SCALE: float = 20

const TOTAL_SPIN_TIME: float = 3
const SPIN_TIMEOUT: float = 0.5

@onready var alien: Sprite2D = $Alien

var speed: float = 0
var dest: Vector2 = Vector2(0, 0)

var first_press_time: float = 0
var last_press_time: float = 0

func _physics_process(delta: float) -> void:
	first_press_time += delta
	if first_press_time > TOTAL_SPIN_TIME:
		done()
	
	last_press_time += delta
	if last_press_time > SPIN_TIMEOUT:
		first_press_time = 0
	
	speed = max(speed - SPEED_DECAY * delta, 0)
	alien.rotate(speed * delta)
	alien.position += LINEAR_SPEED_SCALE * speed * delta * (dest - alien.position).normalized()

func _on_button_pressed() -> void:
	last_press_time = 0
	
	speed = min(speed + SPEED_BOOST, MAX_SPEED)
	dest = Vector2(randi_range(-100, 100), randi_range(-100, 100))
