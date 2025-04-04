extends StaticBody2D


class_name Cup

static var num_cups: int = 0

@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	num_cups += 1


func die() -> void:
	animation_player.play("vanish")
	

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit") and num_cups > 0:
		num_cups = 0


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	num_cups -= 1
	SignalHub.emit_on_cup_destroyed(num_cups)
	queue_free()
