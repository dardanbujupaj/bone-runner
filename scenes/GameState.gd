extends Node


var run_started := false

var time := 0.0
var attempts := 0
var room_attempts := 0

var skipped_rooms := []


func _process(delta: float) -> void:
	if run_started:
		time += delta




