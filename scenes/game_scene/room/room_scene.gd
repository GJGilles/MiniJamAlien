extends Area2D

class_name RoomScene

const SPORE_SCENE: PackedScene = preload("res://scenes/game_scene/spore/spore_scene.tscn")

@onready var alien_scene: AlienScene = $AlienScene
@onready var spores: Node2D = $Spores

const SPORE_LIMIT: int = 5

func deposit(carry: MOUSE.CarryData):
	if carry is MOUSE.CarryFoodData and alien_scene.data != null:
		if alien_scene.data.do_food_want(carry.food):
			var roll: int = 1 + randi() % 100
			if spores.get_child_count() < SPORE_LIMIT and roll < alien_scene.data.happiness:
				var spore: SporeScene = SPORE_SCENE.instantiate()
				spores.add_child(spore)
				spore.set_values(alien_scene.data.get_spore_sprite(), alien_scene.data.get_spore_cost())

func suck_to(pos: Vector2, force: float):
	for child: SporeScene in spores.get_children():
		child.apply_central_force(force * (pos - child.global_position).normalized())
