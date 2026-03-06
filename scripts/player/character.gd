extends CharacterBody3D

class_name myPlayer

const SPEED: float = 15.0

var input_dir := Input.get_vector("left", "right", "up", "down")
var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D

#states
@onready var default_movement: Node = $states/defaultMovement
@onready var move_to_point: Node = $states/moveToPoint
@onready var fishing: Node = $states/fishing
@onready var navigationMovement: Node = $states/navigationMovement


var currentState: State
var isInInteractionBox: bool
var interactionBoxes: Array[Area3D]
var interractionTarget: Area3D

var navigationTarget: Vector3

func _ready() -> void:
	currentState = default_movement
	currentState.start()

func _physics_process(_delta: float):
	
	#update state
	currentState.update(_delta)

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
func interract():
	if Input.is_action_just_pressed("interract"):
		if not interactionBoxes.is_empty():
			interractionTarget = interactionBoxes[0]
			interractionTarget.interract()

func navMovement():
	if navigationTarget:
		print(navigationTarget)
		nav_agent.target_position = navigationTarget
		var next_path_pos := nav_agent.get_next_path_position()
		var direction := global_position.direction_to(next_path_pos)
		velocity = direction * SPEED

		if nav_agent.is_navigation_finished():
				print("target found")
				navigationTarget = Vector3.ZERO
				interractionTarget.interract()
				
	else:
		print("no target, navigation aborted")
		changeState(default_movement)
