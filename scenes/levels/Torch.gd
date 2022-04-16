extends Light2D

var noise = OpenSimplexNoise.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	noise.seed = randi()
	noise.period = 1.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	energy = 1 + 0.1 * noise.get_noise_1d(OS.get_ticks_msec() / 1000.0)
