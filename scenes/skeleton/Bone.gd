extends RigidBody2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	$AudioStreamPlayer2D.pitch_scale = 1.0 + rand_range(-0.3, 0.4)


func set_texture(texture: Texture) -> void:
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
		$AudioStreamPlayer2D.volume_db = linear2db(clamp(velocity, 0, 200) / 200)
		
		$AudioStreamPlayer2D.play()
