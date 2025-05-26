extends CanvasLayer

@onready var animation_player = $AnimationPlayer
@onready var alien_shop = $Shop/AlienShop
@onready var upgrade_shop = $Shop/UpgradeShop

@onready var penta: AnimationPlayer = $Shop/Control/AnimationPlayer


var is_shop_active: bool = true

func _ready():
	penta.animation_finished.connect(func(): penta.play("idle"))
	penta.play("welcome")
	GAME.on_sell.connect(func():
		if alien_shop.visible:
			penta.play("adopt")
		else:
			penta.play("buy")
	)

func _on_tab_pressed():
	if is_shop_active:
		animation_player.play("slide_out")
	else:
		animation_player.play_backwards("slide_out")
		penta.play("welcome")
	is_shop_active = not is_shop_active


func _on_page_pressed():
	alien_shop.visible = not alien_shop.visible
	upgrade_shop.visible = not upgrade_shop.visible
