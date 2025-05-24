extends ShopItemData

class_name ShopUpgradeData

@export var room: RoomData
@export var prev: RoomData:
	get:
		return prev
	set(value):
		prev = value
		if prev != null:
			prev.on_update.connect(func(): on_update.emit())

func is_active() -> bool:
	return room != null and not room.is_unlocked and (prev == null or prev.is_unlocked)

func get_sprite() -> Texture2D:
	return load("res://assets/room/none.png")

func on_purchase():
	room.is_unlocked = true
