extends Node


var run_started := false

var time := 0.0
var attempts := 0


func _process(delta: float) -> void:
	if run_started:
		time += delta




