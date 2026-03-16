extends StaticBody3D

@onready var gridMapRoot: GridMapRoot = $".."
@export var gridMapPosition: Vector2
@export var size: int

func _ready():
	gridMapRoot.GridMap_Ready.connect(_on_GridMap_ready)



func _on_GridMap_ready():
	position = gridMapRoot.Assign_To_Gridmap(gridMapPosition, self, size)
