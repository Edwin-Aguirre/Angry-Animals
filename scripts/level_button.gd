extends TextureButton


@export var level_number: String = "1"


@onready var level_label: Label = $MarginContainer/VBoxContainer/LevelLabel
@onready var score_label: Label = $MarginContainer/VBoxContainer/ScoreLabel
@onready var star: Sprite2D = $MarginContainer/VBoxContainer/Star


const STAR_BRONZE = preload("res://assets/other/starBronze.png")
const STAR_DIAMOND = preload("res://assets/other/starDiamond.png")
const STAR_GOLD = preload("res://assets/other/starGold.png")
const STAR_SILVER = preload("res://assets/other/starSilver.png")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_label.text = level_number
	score_label.text = str(ScoreManager.get_level_best(level_number))
	score_star()


func score_star() -> void:
	var best_score = ScoreManager.get_level_best(level_number)
	
	if best_score <= 1:
		star.texture = STAR_DIAMOND
	elif best_score <= 5:
		star.texture = STAR_GOLD
	elif best_score <= 10:
		star.texture = STAR_SILVER
	elif best_score <= 20:
		star.texture = STAR_BRONZE


func _on_mouse_entered() -> void:
	scale = Vector2(1.1,1.1)


func _on_mouse_exited() -> void:
	scale = Vector2(1,1)


func _on_pressed() -> void:
	ScoreManager.level_selected = level_number
	get_tree().change_scene_to_file("res://scenes/level_%s.tscn" % level_number)
