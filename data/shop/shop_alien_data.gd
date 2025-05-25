extends ShopItemData

class_name ShopAlienData

@export var alien: AlienData

func is_active() -> bool:
	return alien != null and not alien.is_unlocked

func can_purchase() -> bool:
	return super.can_purchase() and ROOM.get_without_alien() != null

func get_sprite() -> Texture2D:
	return alien.get_sprite()

func on_purchase():
	var room: RoomData = ROOM.get_without_alien()
	room.alien = alien
	alien.is_unlocked = true
