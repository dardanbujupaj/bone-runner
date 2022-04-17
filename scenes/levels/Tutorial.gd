extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.time = 0.0
	GameState.attempts = 0
	GameState.run_started = true
	
	
	$Move.text = "%s/%s to move." % [
		Keymap.input_to_text(Keymap.input_for_action("left")),
		Keymap.input_to_text(Keymap.input_for_action("right"))
	]
	$Jump.text = "%s to jump." % [
		Keymap.input_to_text(Keymap.input_for_action("up"))
	]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
