extends CanvasLayer

@onready var spin_scene: ActivityScene = $Games/SpinScene
@onready var spray_scene: ActivityScene = $Games/SprayScene

var is_active: bool = false

func start(room: RoomData):
	visible = true
	match room.facility.type:
		GAME.ACTIVITY_TYPE.SPRAY:
			is_active = true
			spray_scene.visible = true
			spray_scene.alien.texture = room.alien.get_sprite()
			spray_scene.on_done.connect(func():
				is_active = false
				visible = false
				spray_scene.visible = false
				room.alien.do_activity_want(GAME.ACTIVITY_TYPE.SPRAY)
			, CONNECT_ONE_SHOT)
		GAME.ACTIVITY_TYPE.POKE:
			is_active = true
			spray_scene.visible = true
			spray_scene.alien.texture = room.alien.get_sprite()
			spray_scene.on_done.connect(func():
				is_active = false
				visible = false
				spray_scene.visible = false
				room.alien.do_activity_want(GAME.ACTIVITY_TYPE.POKE)
			, CONNECT_ONE_SHOT)
		GAME.ACTIVITY_TYPE.SPIN:
			is_active = true
			spin_scene.visible = true
			spin_scene.alien.texture = room.alien.get_sprite()
			spin_scene.on_done.connect(func():
				is_active = false
				visible = false
				spin_scene.visible = false
				room.alien.do_activity_want(GAME.ACTIVITY_TYPE.SPIN)
			, CONNECT_ONE_SHOT)
