extends RigidBody2D


const MAX_MONITORING = 16


export(Texture) var texture: Texture setget _set_texture


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	randomize()
	
	$ResetMonitoringTimer.wait_time = rand_range(0.0, 0.5)
	$ResetMonitoringTimer.start()
	
	$AudioStreamPlayer2D.pitch_scale = 1.0 + rand_range(-0.3, 0.4)





func _set_texture(new_texture: Texture) -> void:
	texture = new_texture
	var image := texture.get_data()
	
	var bitmap := BitMap.new()
	bitmap.create_from_image_alpha(image)
	
	var polygon = bitmap.opaque_to_polygons(Rect2(Vector2(), bitmap.get_size()))[0]
	
	
	
	var center_of_mass := Vector2()
	
	for point in polygon:
		center_of_mass += point
		
	center_of_mass = center_of_mass / polygon.size()
		
	
	$CollisionPolygon2D.polygon = polygon
	$CollisionPolygon2D.position = -center_of_mass
	$Sprite.texture = texture
	$Sprite.position = -center_of_mass
	
	position += center_of_mass


func _on_Bone_body_entered(body: Node) -> void:
	var velocity = linear_velocity.length()
	
	if velocity > 10:
		set_deferred("contact_monitor", false)
		$AudioStreamPlayer2D.volume_db = linear2db(clamp(velocity, 0, 200) / 200)
		
		$AudioStreamPlayer2D.play()


# Disable contact monitoring for sound
func _on_ResetMonitoringTimer_timeout() -> void:
	set_deferred("contact_monitor", true)
	$ResetMonitoringTimer.wait_time = rand_range(0.5, 1.5)
	$ResetMonitoringTimer.start()

