extends Area2D


export(String, FILE, "*.tscn") var destination_room: String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RoomHelper.prepare_room(destination_room)


func _on_Door_body_entered(body: Node) -> void:
	RoomHelper.load_room(destination_room)
