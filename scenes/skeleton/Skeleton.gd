extends KinematicBody2D

var start_position: Vector2

var velocity: Vector2

onready var animation_tree = $AnimationTree

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	velocity.y += 800 * delta
	
	if is_on_floor() and Input.is_action_just_pressed("up"):
		velocity.y -= 800
	
	
	var horizontal_input = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	
	velocity.x += horizontal_input * delta * 100
	
	
	velocity = move_and_slide(velocity)
	
	animation_tree["parameters/conditions/moving"] = abs(velocity.x) > 1.0
	animation_tree["parameters/conditions/not_moving"] = abs(velocity.x) <= 1.0

func die() ->  void:
	var nodes_to_check = get_children()
	
	while nodes_to_check.size() > 0:
		var n = nodes_to_check.pop_front()
		nodes_to_check.append_array(n.get_children())
		
		if n is Sprite:
			create_bone(n)
	
	position = start_position
	velocity = Vector2()
	
	
	

func create_bone(sprite: Sprite) -> void:
	var bone = preload("res://Bone.tscn").instance()
	
	bone.position = sprite.global_position + sprite.offset - sprite.texture.get_size() / 2
	bone.rotation = sprite.global_rotation
	
	bone.set_texture(sprite.texture)
	
	# bone.linear_velocity = Vector2(300, 0)
	get_parent().call_deferred("add_child", bone)



func _on_HitArea_area_entered(area: Area2D) -> void:
	die()
