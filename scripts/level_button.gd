extends TextureButton


@onready var level_button: TextureButton = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_mouse_entered() -> void:
	scale = Vector2(1.1,1.1)


func _on_mouse_exited() -> void:
	scale = Vector2(1,1)
