extends Node

var all_rooms: Array[RoomData] = [
	preload("res://resources/rooms/room_1.tres"),
	preload("res://resources/rooms/room_2.tres"),
	preload("res://resources/rooms/room_3.tres"),
	preload("res://resources/rooms/room_4.tres"),
	preload("res://resources/rooms/room_5.tres"),
	preload("res://resources/rooms/room_6.tres")
]

func get_without_alien() -> RoomData:
	for r: RoomData in all_rooms:
		if r.is_unlocked and r.alien == null:
			return r
	return null

func get_without_facility() -> RoomData:
	for r: RoomData in all_rooms:
		if r.is_unlocked and r.facility == null:
			return r
	return null
