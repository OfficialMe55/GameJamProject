extends Camera3D

const CAMERA_POSITION_SHIFT = Vector3(0, 7.5, 7)

const RAYCAST_RANGE = 100

@export var playerNode: CharacterBody3D
@export var gridmap: GridMapRoot
@export var rayCast: RayCast3D

func _process(_delta: float):
	if not playerNode == null:
		global_position = playerNode.global_position + CAMERA_POSITION_SHIFT

func Get_Cell_From_Mouse_Position():
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	rayCast.target_position = project_local_ray_normal(mouse_position) * RAYCAST_RANGE
	rayCast.force_raycast_update()
	
	if rayCast.is_colliding():
		var collider = rayCast.get_collider()
		if collider is cell:
			return collider
		
func disable_raycast():
	rayCast.force_raycast_update()
