extends CanvasLayer

@onready var animation_player = $AnimationPlayer
@onready var alien_shop = $Shop/AlienShop
@onready var upgrade_shop = $Shop/UpgradeShop

@onready var penta: AnimationPlayer = $Shop/Control/AnimationPlayer

@onready var tutorial = $Tutorial/Dialog/Label

const TUTORIAL_TIMEOUT: float = 10.0
const TUTORIAL_TEXT: Array[String] = [
	"You can make your alien happy by petting it with the Pet Tool (Green hand) ~",
	"Bee sure to feed you aliens with the correct food when they are hungry!",
	"Happy Aliens will emit spores that you can  suck up with the vacuum and sell to earn Penta Dimes - Pimes for short 🙂",
	"Bee sure to buy enriching activites from the store for your aliens!",
	"When your alien wants enrichment, you can drag them to the appropriate room using the Cursor Tool! Then click on machine to bee-gin the Enrichment!",
	"Do your best to adopt all of the aliens and make them as happy as can bee!! 🙂"
]

var tutorial_time: float = 0
var tutorial_index: int = -1

var is_shop_active: bool = true

func _ready():
	penta.animation_finished.connect(func(_anim): penta.play("idle"))
	penta.play("welcome")
	GAME.on_sell.connect(func():
		if alien_shop.visible:
			penta.play("adopt")
		else:
			penta.play("buy")
	)

func _process(delta):
	tutorial_time += delta
	if tutorial_time > TUTORIAL_TIMEOUT:
		tutorial_time = 0
		tutorial_index += 1
		if tutorial_index >= TUTORIAL_TEXT.size():
			tutorial_index = 0
		tutorial.text = TUTORIAL_TEXT[tutorial_index]

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
