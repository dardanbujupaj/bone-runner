extends Area2D


export(String, FILE, "*.tscn") var destination_room: String


func _ready() -> void:
	get_tree().call_group("game", "prepare_room", destination_room)


func _on_Door_body_entered(body: Node) -> void:
	get_tree().call_group("game", "load_room", destination_room)
