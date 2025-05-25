extends Node2D

class_name ActivityScene

signal on_done()

func done():
	on_done.emit()
