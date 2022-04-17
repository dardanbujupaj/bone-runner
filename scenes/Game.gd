extends Node


onready var current_room := $Room


var prepared_rooms := {}


func _process(delta: float) -> void:
	$CanvasLayer/HBoxContainer.visible = GameState.run_started
	$CanvasLayer/HBoxContainer/Skip.visible = GameState.room_attempts >= 3


func skip() -> void:
	var next = prepared_rooms.keys()[0]
	GameState.skipped_rooms.append(next.get_file().trim_suffix(".tscn").capitalize())
	load_room(next)


func load_room(path: String) -> void:
	
	
	if path.empty():
		return
	
	
	var next_room: Node2D
	
	
	
	if prepared_rooms.has(path):
		next_room = prepared_rooms[path]
	else:
		next_room = load(path).instance()
	
	
	$CanvasLayer/HBoxContainer/RoomName.text = path.get_file().trim_suffix(".tscn").capitalize()
	
	prepared_rooms.clear()
	
	current_room.queue_free()
	call_deferred("add_child", next_room)
	current_room = next_room
	
	GameState.room_attempts = 0


func prepare_room(path: String) -> void:
	if path.empty():
		return
	
	call_deferred("_prepare_internal", path)


func _prepare_internal(path: String) -> void:
	var instance = load(path).instance()
	prepared_rooms[path] = instance



func _on_Skip_pressed() -> void:
	call_deferred("skip")
