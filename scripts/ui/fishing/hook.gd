extends Area2D

@export var keepInBox: Node

var velocity: Vector2 = Vector2(0,0)
@export var termVelPos: float
@export var termVelNeg: float

@export var acSpeed: float

var boost = 0

func _ready() -> void:
	pass

var lastSpeed = 0

func _process(delta: float) -> void:
	
	if Input.is_action_pressed("fish"):
		velocity.y -= acSpeed
	else:
		velocity.y += acSpeed
	
	if velocity.y > termVelPos:
		velocity.y = termVelPos
	elif velocity.y < termVelNeg:
		velocity.y = termVelNeg
	
	if Input.is_action_pressed("boost"):
		boost += .1
	else:
		boost -= .1
	
	if boost > 1:
		boost = 1
	elif boost < 0:
		boost = 0
	
	if Input.is_action_pressed("leftArrow"):
		position.x -= 1
	if Input.is_action_pressed("rightArrow"):
		position.x += 1
	
	position += velocity + Vector2(0, boost)
	
	position = keepInBox.trapVector(position)
