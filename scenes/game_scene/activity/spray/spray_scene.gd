extends ActivityScene

@onready var laser_0: Sprite2D = $Lasers/Laser0
@onready var laser_1: Sprite2D = $Lasers/Laser1
@onready var laser_2: Sprite2D = $Lasers/Laser2
@onready var laser_3: Sprite2D = $Lasers/Laser3

@onready var clump_0: Sprite2D = $Alien/Clump0
@onready var clump_1: Sprite2D = $Alien/Clump1
@onready var clump_2: Sprite2D = $Alien/Clump2
@onready var clump_3: Sprite2D = $Alien/Clump3

@onready var audio = $AudioStreamPlayer

const LASER_TIME: float = 1

var clumps: Dictionary[int, float] = {}
var active_laser: int = -1

func _ready() -> void:
	visibility_changed.connect(func():
		if is_visible_in_tree():
			on_open()
	)

func on_open():
	clumps = {}
	for i in range(3):
		var idx: int = randi() % 4
		clumps[idx] = LASER_TIME
		get_sprite_node(idx).visible = true
		get_sprite_node(idx).modulate = Color(1, 1, 1, 1)

func _physics_process(delta: float) -> void:
	if active_laser >= 0:
		if not audio.playing or audio.get_playback_position() > 0.1:
			audio.play()
	else:
		audio.stop()
	
	if clumps.has(active_laser):
		clumps[active_laser] -= delta
		get_sprite_node(active_laser).modulate = Color(1, 1, 1, 0.5 + clumps[active_laser] / (2 * LASER_TIME))
		
		if clumps[active_laser] < 0:
			get_sprite_node(active_laser).visible = false
			clumps.erase(active_laser)
		
		if clumps.values().size() == 0:
			active_laser = -1
			done()

func get_laser_node(i: int) -> Sprite2D:
	match i:
		0:
			return laser_0
		1:
			return laser_1
		2:
			return laser_2
		3:
			return laser_3
		_:
			return null

func get_sprite_node(i: int) -> Sprite2D:
	match i:
		0:
			return clump_0
		1:
			return clump_1
		2:
			return clump_2
		3:
			return clump_3
		_:
			return null

func _button_down(i: int):
	active_laser = i
	get_laser_node(i).visible = true

func _button_up(i: int):
	get_laser_node(i).visible = false
	if active_laser == i:
		active_laser = -1
