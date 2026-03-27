extends Area2D

@export var keepInBox: Node

var velocity: Vector2 = Vector2(0,0)
@export var termVelPos: Vector2
@export var termVelNeg: Vector2

@export var acSpeed: Vector2
var direction: int

var lastPos: Vector2

var boost = 0

@export_group("Car Properties")
@export_subgroup("Wheels", "wheel_")
@export_subgroup("Wheels/Front", "front_wheel_")
@export var front_wheel_strength = 10
@export var front_wheel_mobility = 5
@export_subgroup("Wheels/Rear", "rear_wheel_")
@export var rear_wheel_strength = 8
@export var rear_wheel_mobility = 3
@export_subgroup("Wheels", "wheel_")
@export var wheel_material: PhysicsMaterial

func _ready() -> void:
	pass

var lastSpeed = 0

func _process(delta: float) -> void:
	
	if Input.is_action_pressed("fish"):
		velocity.y -= acSpeed.y
	else:
		velocity.y += acSpeed.y
	
	if velocity.y > termVelPos.y:
		velocity.y = termVelPos.y
	elif velocity.y < termVelNeg.y:
		velocity.y = termVelNeg.y
	
	if Input.is_action_pressed("boost"):
		boost += .1
	else:
		boost -= .1
	
	if boost > 1:
		boost = 1
	elif boost < 0:
		boost = 0
	
	direction = int(Input.is_action_pressed("rightArrow")) - int(Input.is_action_pressed("leftArrow"))
	
	velocity.x = move_toward(velocity.x, direction * termVelPos.x, acSpeed.x * (1 + abs(direction)))
	
	lastPos = position
	position += velocity + Vector2(0, boost)
	
	position = keepInBox.trapVector(position)
	if position.y == lastPos.y:
		velocity.y = 0
	if position.x == lastPos.x:
		velocity.x = 0
