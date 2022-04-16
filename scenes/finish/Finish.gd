extends Node2D

onready var time := $VBoxContainer/HBoxContainer2/Time
onready var attempts := $VBoxContainer/HBoxContainer/Attempts

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Skeleton.dance()
	for skeleton in $Fans.get_children():
		skeleton.set_physics_process(false)
		skeleton.clap()
		skeleton.get_node("AnimationPlayer").seek(rand_range(0.0, 1.0))
	
	
	GameState.run_started = false
	
	var minutes := floor(GameState.time / 60.0)
	var seconds := floor(GameState.time - (minutes * 60))
	time.text = "%02d:%02d" % [minutes, seconds]
	attempts.text = "%3d" % GameState.attempts

