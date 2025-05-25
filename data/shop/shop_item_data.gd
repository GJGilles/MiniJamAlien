extends Resource

class_name ShopItemData

@export var cost: int = 1

signal on_update()

func is_active() -> bool:
	return true

func get_sprite() -> Texture2D:
	return null

func can_purchase() -> bool:
	return GAME.money >= cost

func purchase():
	if can_purchase():
		GAME.money -= cost
		on_purchase()
	else:
		pass
	on_update.emit()
		
func on_purchase():
	pass
