extends Polygon2D


var up = polygon[0].y
var down = polygon[2].y
var left = polygon[0].x
var right = polygon[2].x

var rect: Rect2

func _ready() -> void:
	print(polygon)
	return
	rect = Rect2(Vector2(left, up), Vector2(down, right))
	print(rect)

func trapVector(vector: Vector2):
	var newVector = Vector2()
	newVector.x = clamp(vector.x, right, left)
	newVector.y = clamp(vector.y, up, down)
	return newVector
