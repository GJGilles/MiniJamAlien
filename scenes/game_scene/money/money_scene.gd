extends CanvasLayer

@onready var label: Label = $Label

func _ready() -> void:
	GAME.on_update.connect(update)
	update()

func update():
	label.text = str(GAME.money)
