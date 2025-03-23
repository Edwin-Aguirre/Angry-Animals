extends Control

@onready var level_label: Label = $MarginContainer/VBLevelInfo/LevelLabel
@onready var attempt_label: Label = $MarginContainer/VBLevelInfo/AttemptLabel
@onready var vb_level_complete: VBoxContainer = $MarginContainer/VBLevelComplete
@onready var music: AudioStreamPlayer = $Music


var attempts: int = -1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_label.text = "Level %3s" % ScoreManager.level_selected
	attempt_made()


func _enter_tree() -> void:
	SignalHub.on_attempt_made.connect(attempt_made)
	SignalHub.on_cup_destroyed.connect(cup_destroyed)


func attempt_made() -> void:
	attempts += 1
	attempt_label.text = "Attempt %3s" % attempts


func cup_destroyed(remaining_cups: int) -> void:
	if remaining_cups == 0:
		vb_level_complete.show()
		music.play()
