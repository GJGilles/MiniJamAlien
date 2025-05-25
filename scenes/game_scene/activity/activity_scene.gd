extends Node2D

class_name ActivityScene

@onready var alien: Sprite2D = $Alien

signal on_done()

func done():
	on_done.emit()
