extends Timer

var rng = RandomNumberGenerator.new()

@export var min: float
@export var max: float

func setTimer():
	pass


func _on_timeout() -> void:
	wait_time = rng.randf_range(min, max)
