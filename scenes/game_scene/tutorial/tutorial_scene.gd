extends Control

@onready var tutorial = $Dialog/Label

const TUTORIAL_TIMEOUT: float = 20.0
const TUTORIAL_TEXT: Array[String] = [
#	0: ON START
	"Greetings Cadet! Choose an Alien to adopt into your care!\nFirst, let's adopt one from the Penta Store!",
#	1: ON BUY PET
	"You can make your alien happy by petting it with the Pet Tool (Green hand) ~",
#	2: ON FOOD WANT
	"Bee sure to feed you aliens with the correct food when they are hungry!",
#	3: ON SPORE
	"Happy Aliens will emit spores that you can suck up with the vacuum and sell to earn Penta Dimes - Pimes for short :)",
#	4: ON ACTIVITY WANT
	"Bee sure to buy enriching activites from the store for your aliens!",
#	5: ON ACTIVITY BUY
	"When your alien wants enrichment, you can drag them to the appropriate room using the Cursor Tool! Then click on machine to bee-gin the Enrichment!",
#	6: ON DONE TUTORIAL
	"Do your best to adopt all of the aliens and make them as happy as can bee!! :)"
]

var aliens: Array[AlienData] = [
	load("res://resources/aliens/blue.tres"),
	load("res://resources/aliens/green.tres"),
	load("res://resources/aliens/orange.tres"),
	load("res://resources/aliens/purple.tres"),
	load("res://resources/aliens/red.tres"),
	load("res://resources/aliens/yellow.tres")
]
var room_1: RoomData = load("res://resources/rooms/room_1.tres")

var tutorial_time: float = 0
var tutorial_count: int = 0

func _ready():
	show_tutorial(0)
	for a in aliens:
		a.on_update.connect(on_purchase)

func show_tutorial(num: int):
	tutorial.text = TUTORIAL_TEXT[num]
	visible = true
	tutorial_time = 0
	tutorial_count += 1

func on_purchase():
	show_tutorial(1)
	for a in aliens:
		a.on_update.disconnect(on_purchase)
		
	room_1.alien.want_food.on_update.connect(func(): show_tutorial(2), CONNECT_ONE_SHOT)
	room_1.on_spore_added.connect(func(_s): show_tutorial(3), CONNECT_ONE_SHOT)
	room_1.alien.want_activity.on_update.connect(func(): show_tutorial(4), CONNECT_ONE_SHOT)
	room_1.on_update.connect(on_room_update)

func on_room_update():
	if room_1.facility != null:
		room_1.on_update.disconnect(on_room_update)
		show_tutorial(5)

func _process(delta):
	tutorial_time += delta
	if tutorial_time > TUTORIAL_TIMEOUT:
		visible = false
		if tutorial_count == 6:
			show_tutorial(6)
