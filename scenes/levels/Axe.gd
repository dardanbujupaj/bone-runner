extends Node2D


onready var tween := $Tween


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tween.interpolate_property($Axe, "rotation", -PI / 2, PI / 2, 2.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.interpolate_property($Axe, "rotation", PI / 2, -PI / 2, 2.0, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 2.0)
	tween.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
