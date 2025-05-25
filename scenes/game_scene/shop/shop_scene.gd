extends CanvasLayer

@onready var animation_player = $AnimationPlayer
@onready var alien_shop = $Shop/AlienShop
@onready var upgrade_shop = $Shop/UpgradeShop

var is_shop_active: bool = true

func _on_tab_pressed():
	if is_shop_active:
		animation_player.play("slide_out")
	else:
		animation_player.play_backwards("slide_out")
	is_shop_active = not is_shop_active


func _on_page_pressed():
	alien_shop.visible = not alien_shop.visible
	upgrade_shop.visible = not upgrade_shop.visible
