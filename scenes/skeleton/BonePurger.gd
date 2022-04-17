extends Node


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var bones = get_tree().get_nodes_in_group("bones")
	var bone_count = bones.size()
	
	for i in range(floor((bone_count - Settings.max_bones) / 10)):
		bones[i].queue_free()
	
