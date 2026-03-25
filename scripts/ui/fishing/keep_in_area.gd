extends Polygon2D


var up = self.polygon[0].y
var down = self.polygon[2].y
var left = self.polygon[0].x
var right = self.polygon[2].x

var rect: Rect2

func _ready() -> void:
	rect = Rect2(Vector2(left, up), Vector2(down, right))
	print(rect)
