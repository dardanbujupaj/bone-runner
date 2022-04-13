extends Area2D


export(PackedScene) var destination_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Door_body_entered(body: Node) -> void:
	print("body entered")
	get_tree().change_scene_to(destination_scene)
