extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Move.text = "%s/%s to move." % [
		Keymap.input_to_text(Keymap.input_for_action("left")),
		Keymap.input_to_text(Keymap.input_for_action("right"))
	]
