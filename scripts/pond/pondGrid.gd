extends StaticBody3D

const size = 2

@onready var gridMapRoot: GridMapRoot = $".."
@export var gridMapPosition: Vector2

func _ready():
	gridMapRoot.GridMap_Ready.connect(_on_GridMap_ready)



func _on_GridMap_ready():
	position = gridMapRoot.Assign_To_Gridmap(gridMapPosition, self, size)
