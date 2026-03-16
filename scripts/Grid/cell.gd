extends Area3D

class_name cell

@export var shape: CollisionShape3D
@export var midpoint: Marker3D
var gridPosition: Vector2

var content = null

func is_empty() -> bool:
	if content:
		return false
	return true

func assignContent(body: StaticBody3D):
	print(gridPosition)
	print(body)
	content = body
	updateDebugColor()
	
func removeContent():
	content = null
	updateDebugColor()

func updateDebugColor():
	if content:
		shape.debug_color = Color("0099b36b")
	else:
		shape.debug_color = Color("f7204886")
	pass
