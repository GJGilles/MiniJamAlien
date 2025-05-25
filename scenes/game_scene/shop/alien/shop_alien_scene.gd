extends Control

@onready var alien = $Alien
@onready var cost = $Cost/Label

@export var data: ShopItemData:
	get:
		return data
	set(value):
		data = value
		if data != null:
			data.on_update.connect(on_update)
			on_update()

var is_ready: bool = false

func _ready() -> void:
	is_ready = true

func on_update():
	if !is_ready:
		await ready
	
	visible = data.is_active()
	alien.texture = data.get_sprite()
	cost.text = str(data.cost)


func _on_pressed() -> void:
	data.purchase()
