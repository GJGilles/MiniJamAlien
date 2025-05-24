extends Control

@onready var texture_rect: TextureRect = $Button/TextureRect

@export var mode: MOUSE.MOUSE_MODE

func _on_button_pressed() -> void:
	MOUSE.mode = mode
