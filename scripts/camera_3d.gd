extends Camera3D

const CAMERA_POSITION_SHIFT = Vector3(0, 7.5, 7)

@export var playerNode: CharacterBody3D

func _process(_delta: float):
	if not playerNode == null:
		global_position = playerNode.global_position + CAMERA_POSITION_SHIFT
