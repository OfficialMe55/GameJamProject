extends CharacterBody3D

class_name myPlayer

const SPEED: float = 15.0
const GHOST_BUILDING_OFFSET = Vector3(0, 0.01, 0)

var input_dir := Input.get_vector("left", "right", "up", "down")
var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

var gridMap: GridMapRoot

@export var humanHook: Marker3D

# essential connections
@export var ui: UiParent
@export var world: Node

@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D
@onready var decorations_scene = load("res://scenes/decorations/Decoration.tscn")


#states
@onready var default_movement: Node = $states/defaultMovement
@onready var move_to_point: Node = $states/moveToPoint
@onready var fishing: Node = $states/fishing
@onready var navigationMovement: Node = $states/navigationMovement
@onready var carryingHuman: Node = $states/CarryingHuman
@onready var shop: Node = $states/shop
@onready var building: Node = $states/building
@onready var navRegion: NavigationRegion3D = $"../NavigationRegion3D"
@onready var inventory: Node = $states/inventory

var currentState: State

var isInInteractionBox: bool
var interactionBoxes: Array[Area3D]
var interactionTarget: Area3D

var carriedHuman: myHuman

var selectedBuilding: Decoration

var navigationTarget: Vector3
var camera: Camera3D

func _ready() -> void:
	Global.player = self
	
	currentState = default_movement
	currentState.start()
	gridMap = $"../NavigationRegion3D/plane/GridMapRoot"
	camera = $"../Camera3D"
	
																										
func _physics_process(_delta: float):
	#update state
	currentState.update(_delta)
	velocity.y = 0                 #bleeerp! im sorry :(
	move_and_slide()

func changeState(nextState: State):
	currentState.end()
	currentState = nextState
	currentState.start()

func getInput():
	input_dir = Input.get_vector("left", "right", "up", "down")
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if Input.is_action_just_pressed("Place"):
#		mousePosition = 
		pass
	

func normalMovement():
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

func interact():
	if Input.is_action_just_pressed("interract"):
		if not interactionBoxes.is_empty():
			var currentweight: int = 0
			for interactionBox in interactionBoxes:
				if interactionBox.weight > currentweight:
					interactionTarget = interactionBox
					currentweight = interactionBox.weight
			interactionTarget.interact()
		return
		
	if Input.is_action_just_pressed("Inventory"):
		changeState(inventory)

func inventory_function(resource: deco):
	selectedBuilding = decorations_scene.instantiate()
	selectedBuilding.setDecoration("idol")
	selectedBuilding.loadSprite("Idol_PLACEHOLDER")
	gridMap.add_child(selectedBuilding)
	selectedBuilding = Decoration.construct(resource)
	gridMap.add_child(selectedBuilding)

func deco_selected(resource):
	inventory_function(resource)
	changeState(building)

func navMovement():
	if navigationTarget:
		nav_agent.target_position = navigationTarget
		var next_path_pos := nav_agent.get_next_path_position()
		var navDirection := global_position.direction_to(next_path_pos)
		velocity = navDirection * SPEED

		if nav_agent.is_navigation_finished():
				print("target found")
				navigationTarget = Vector3.ZERO
				interactionTarget.interact()
				
	else:
		print("no target, navigation aborted")
		changeState(default_movement)

func dropHuman():
	carriedHuman.changeState(carriedHuman.freeRoam)
	changeState(default_movement)


func build():
	if not selectedBuilding: #failsafe condition, might delete later
		changeState(default_movement)
		printerr("Entered build state without building assigned")
		return
	if Input.is_action_just_pressed("cancel_Place"):
		selectedBuilding.queue_free()
		selectedBuilding = null
		changeState(default_movement)
		return
		
	if not camera.Get_Cell_From_Mouse_Position():
		return
	
	#This stuff can be moved to the moment an object is selected from inventory
	#print(selectedBuilding)
	selectedBuilding.deactivate()
	selectedBuilding.sprite.transparency = 0.2

	var DecorationSize = selectedBuilding.myResource.size #temporary ugly variable. To be replaced by size collected from resource
	var hovered_cell: cell = camera.Get_Cell_From_Mouse_Position()
	var building_ghost_position: Vector3 = gridMap.Get_Position_From_Cell(hovered_cell.gridPosition, selectedBuilding, DecorationSize)
	selectedBuilding.position = building_ghost_position + GHOST_BUILDING_OFFSET
	
	var spaceAvailable: bool = gridMap.is_Space_Available(hovered_cell.gridPosition, DecorationSize)
	
	if not spaceAvailable:
		selectedBuilding.sprite.modulate = Color(1,0,0)
		selectedBuilding.sprite.transparency = 0.1
	else:
		selectedBuilding.sprite.modulate = Color(1, 1, 1) #remove modulation
		selectedBuilding.sprite.transparency = 0.2
	
	if Input.is_action_just_pressed("Place") and spaceAvailable:
		
		selectedBuilding.position = gridMap.Assign_To_Gridmap(hovered_cell.gridPosition, selectedBuilding, DecorationSize)
		selectedBuilding.sprite.transparency = 0
		selectedBuilding.activate()
		selectedBuilding = null
		navRegion.bake_navigation_mesh()
		changeState(default_movement)
		
	
	
	
	#if gridMap.is_Space_Available()
	
