extends ShopItemData

class_name ShopAlienData

@export var type: GAME.ALIEN_TYPE

func can_purchase() -> bool:
	return super.can_purchase() and ROOM.get_without_alien() != null

func get_sprite() -> Texture2D:
	return GAME.get_alien_texture(type)

func on_purchase():
	var room: RoomData = ROOM.get_without_alien()
	match type:
		GAME.ALIEN_TYPE.BLUE:
			room.alien = AlienBlueData.new()
		GAME.ALIEN_TYPE.GREEN:
			room.alien = AlienGreenData.new()
		GAME.ALIEN_TYPE.ORANGE:
			room.alien = AlienOrangeData.new()
		GAME.ALIEN_TYPE.PURPLE:
			room.alien = AlienPurpleData.new()
		GAME.ALIEN_TYPE.RED:
			room.alien = AlienRedData.new()
		GAME.ALIEN_TYPE.YELLOW:
			room.alien = AlienYellowData.new()
