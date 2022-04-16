extends Node


onready var current_room := $Room


var prepared_rooms := {}


var attempts = 0.0
var timer = 0.0


func load_room(path: String) -> void:
	if path.empty():
		return
	
	
	var next_room: Node2D
	
	if prepared_rooms.has(path):
		next_room = prepared_rooms[path]
	else:
		next_room = load(path).instance()
	
	
	current_room.queue_free()
	call_deferred("add_child", next_room)
	current_room = next_room


func prepare_room(path: String) -> void:
	if path.empty():
		return
	
	call_deferred("_prepare_internal", path)


func _prepare_internal(path: String) -> void:
	var instance = load(path).instance()
	prepared_rooms[path] = instance
