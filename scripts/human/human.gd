extends CharacterBody3D

class_name myHuman

const SPEED: float = 5.0
const GRAVITY: float = -3.0


@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D

#states
@onready var freeRoam: humanState = $"states/freeRoam" 
@onready var carried: humanState = $"states/carried" 

var player: myPlayer

var navigationTarget: Vector3

var currentState: humanState

func _ready():
	currentState = freeRoam
	
func changeState(nextState: humanState):
	currentState.end()
	currentState = nextState
	currentState.start()


func _physics_process(_delta: float):
	velocity = Vector3.ZERO
	
	currentState.update(_delta)

	move_and_slide()




func FreeRoam():
	if not is_on_floor():
		velocity = Vector3(0,GRAVITY,0)
	else:
		if not navigationTarget:
			if randi() % 100 < 1:
				findNavigationTarget()
		else:
			nav_agent.target_position = navigationTarget
			var next_path_pos := nav_agent.get_next_path_position()
			var navDirection := global_position.direction_to(next_path_pos)
			velocity = navDirection * SPEED

			if nav_agent.is_navigation_finished():
				navigationTarget = Vector3.ZERO

func findNavigationTarget():
	var navRegion: NavigationRegion3D = $"../NavigationRegion3D"
	navigationTarget = NavigationServer3D.map_get_random_point(navRegion.get_navigation_map(), 1, true)
	
	
func getCarried():
	global_position = player.humanHook.global_position
