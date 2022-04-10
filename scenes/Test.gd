extends Node2D


onready var bone_spawner := $BoneSpawner

onready var bone := $Bone

func _ready() -> void:
	randomize()

func _physics_process(delta: float) -> void:
	# bone.position = bone.position.linear_interpolate(get_local_mouse_position(), 10 * delta)
	pass

func _on_Timer_timeout() -> void:
	var spawned_bone := preload("res://scenes/skeleton/ArmLeft.tscn").instance() as RigidBody2D
	
	var sprite = Sprite.new()
	
	spawned_bone.position = bone_spawner.position
	add_child(spawned_bone)
	spawned_bone.call_deferred("apply_impulse", Vector2(rand_range(-50, 50), rand_range(-50, 50)), Vector2(rand_range(-100, 100), rand_range(-100, 0)))
