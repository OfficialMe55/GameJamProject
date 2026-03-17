extends Marker3D

class_name GridMapRoot

@export var navRegion: NavigationRegion3D

@export var gridSizeX: int    # Might make it dynamic in the future if need arises...
@export var gridSizeY: int

var cell: Area3D
var cellShape: CollisionShape3D

var cellSize: Vector2
var cellPointer:= Vector3.ZERO

var gridMapArray: Array[Array] #2D array

signal GridMap_Ready

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cell = preload("res://scenes/cell.tscn").instantiate()
	cellShape = cell.get_node("Shape")
	cellSize = Vector2(cellShape.shape.size.x,cellShape.shape.size.z)
	
	for i in gridSizeX:
		gridMapArray.append([])
		for j in gridSizeY:
			cell = preload("res://scenes/cell.tscn").instantiate()
			cell.position = cellPointer
			cell.gridPosition = Vector2(i, j)
			gridMapArray[i].append(cell)
			add_child(cell)
			
			cellPointer.z += cellSize.y
		cellPointer.x += cellSize.x
		cellPointer.z = 0
	print("Grid Generation Finished")
	GridMap_Ready.emit()

func is_Space_Available(gridPosition: Vector2, size = 1) -> bool:
	for i in range(gridPosition.x, gridPosition.x + size):
		for j in range(gridPosition.y, gridPosition.y + size):
			if not gridMapArray[i][j].is_empty:
				return false
	return true

func Assign_To_Gridmap(gridPosition: Vector2, body:StaticBody3D, size: int = 1) -> Vector3:
	
	#failsafe. Please always use is_Space_Available before Assign_To_Gridmap
	if not is_Space_Available(gridPosition, size):
		print("placement in gridmap aborted - space already occupied")
		return Vector3.ZERO
	
	
	for i in range(gridPosition.x, gridPosition.x + size):
		for j in range(gridPosition.y, gridPosition.y + size):
			gridMapArray[i][j].assignContent(body)
	
	
	
	return gridMapArray[gridPosition.x][gridPosition.y].position
