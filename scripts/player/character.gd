extends CharacterBody3D

class_name myPlayer

const SPEED: float = 15.0

#states
@onready var default_movement: Node = $states/defaultMovement
@onready var move_to_point: Node = $states/moveToPoint

var currentState: State
var isInInteractionBox: bool

func _ready() -> void:
	currentState = default_movement

func _physics_process(_delta: float):
	
	#update state
	currentState.update(_delta)
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	

	move_and_slide()

func changeState(nextState: State):
	currentState.end()
	currentState = nextState
	currentState.start()

func normalMovement():
	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
