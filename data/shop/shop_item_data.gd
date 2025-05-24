extends Resource

class_name ShopItemData

func get_sprite() -> Texture2D:
	return null

func get_cost() -> int:
	return 1

func get_title() -> String:
	return ""

func requires_room() -> bool:
	return true

func purchase():
	if GAME.money < get_cost():
		return
	elif requires_room():
		pass
	else:
		GAME.money -= get_cost()
		on_purchase()
		
func on_purchase():
	pass
