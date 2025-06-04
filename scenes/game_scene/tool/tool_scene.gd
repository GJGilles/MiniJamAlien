extends Control

@onready var texture_rect: TextureRect = $Button/TextureRect
@onready var audio = $AudioStreamPlayer

@export var mode: MOUSE.MOUSE_MODE
@export var sprite: Texture2D

func _ready() -> void:
	texture_rect.texture = sprite

func _on_button_pressed() -> void:
	if MINIGAME.is_active:
		return
		
	MOUSE.mode = mode
	audio.play()
