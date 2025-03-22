extends Node2D


@onready var animal_start: Marker2D = $AnimalStart

const ANIMAL = preload("res://scenes/animal.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_animal()


func _enter_tree() -> void:
	SignalHub.on_animal_died.connect(spawn_animal)


func spawn_animal() -> void:
	var animal = ANIMAL.instantiate()
	animal_start.add_child(animal)
