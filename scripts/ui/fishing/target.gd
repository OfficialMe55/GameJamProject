extends Area2D

@export var keepInArea: Polygon2D
@export var fish: Node

var rng = RandomNumberGenerator.new()

var newPos: Vector2

func generateNewPos():
	newPos.x = rng.randf_range(keepInArea.left, keepInArea.right)
	newPos.y = rng.randf_range(keepInArea.up, keepInArea.down)
	position = newPos

func _ready() -> void:
	generateNewPos()

func hitWall():
	generateNewPos()


func _on_timer_timeout() -> void:
	generateNewPos()
