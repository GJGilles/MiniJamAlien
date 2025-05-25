extends Label
func _ready() -> void:
	GAME.on_update.connect(update)
	update()

func update():
	text = str(GAME.money)
