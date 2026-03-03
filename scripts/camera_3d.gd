extends Camera3D

const CAMERA_POSITION_SHIFT = Vector3(0, 7.5, 7)

var playerNode: Node

func _process(_delta: float):
	playerNode = get_node("../Player")
	global_position = playerNode.global_position + CAMERA_POSITION_SHIFT
	pass
