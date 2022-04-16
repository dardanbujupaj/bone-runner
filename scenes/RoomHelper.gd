extends Node


var game: Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_tree().get_nodes_in_group("game").size() > 0:
		game = get_tree().get_nodes_in_group("game")[0]


func prepare_room(path: String) -> void:
	if game != null:
		game.prepare_room(path)


func load_room(path: String) -> void:
	if game != null:
		game.load_room(path)
