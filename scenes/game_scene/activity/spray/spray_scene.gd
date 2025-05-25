extends ActivityScene

@onready var clump_0: Sprite2D = $Alien/Clump0
@onready var clump_1: Sprite2D = $Alien/Clump1
@onready var clump_2: Sprite2D = $Alien/Clump2
@onready var clump_3: Sprite2D = $Alien/Clump3

var clumps: Dictionary[int, bool] = {}

func _ready() -> void:
	clumps = {}
	for i in range(3):
		var idx: int = randi() % 4
		clumps[idx] = false
		get_sprite_node(idx).visible = true

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

func clean(i: int): 
	if clumps.has(i):
		clumps[i] = true
		get_sprite_node(i).visible = false
		
		if clumps.values().any(func(val: bool): return not val):
			done()
