extends CharacterBody3D

class_name myPlayer

const SPEED: float = 15.0

var input_dir := Input.get_vector("left", "right", "up", "down")
var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

@export var humanHook: Marker3D

@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D

#states
@onready var default_movement: Node = $states/defaultMovement
@onready var move_to_point: Node = $states/moveToPoint
@onready var fishing: Node = $states/fishing
@onready var navigationMovement: Node = $states/navigationMovement
@onready var carryingHuman: Node = $states/CarryingHuman

var currentState: State
var isInInteractionBox: bool
var interactionBoxes: Array[Area3D]
var interactionTarget: Area3D

var carriedHuman: myHuman

var navigationTarget: Vector3

func _ready() -> void:
	currentState = default_movement
	currentState.start()
	
	
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

func normalMovement():
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)


#in future select interaction target more intelligently using weights
func interact():
	if Input.is_action_just_pressed("interract"):
		if not interactionBoxes.is_empty():
			var currentweight: int = 0
			for interactionBox in interactionBoxes:
				if interactionBox.weight > currentweight:
					interactionTarget = interactionBox
					currentweight = interactionBox.weight
			interactionTarget.interact()

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

#func dropHuman():
	#if Input.is_action_just_pressed("interract"):
		#carriedHuman.changeState(carriedHuman.freeRoam)
		#changeState(default_movement)

func dropHuman():
	carriedHuman.changeState(carriedHuman.freeRoam)
	changeState(default_movement)
