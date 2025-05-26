extends ShopItemData

class_name ShopFacilityData

@export var type: GAME.ACTIVITY_TYPE
@export var room: RoomData:
	get:
		return room
	set(value):
		room = value
		if room != null:
			room.on_update.connect(func(): on_update.emit())
			
@export var prev: RoomData:
	get:
		return prev
	set(value):
		prev = value
		if prev != null:
			prev.on_update.connect(func(): on_update.emit())

func is_active() -> bool:
	return room != null and room.is_unlocked and room.facility == null and (prev == null or prev.facility != null)

func get_sprite() -> Texture2D:
	return GAME.get_item_texture(type)

func on_purchase():
	room.facility = FacilityData.create(type)
