extends Area2D

@export var target: Node
@export var bigKeep: Node

var vectorToTarget: Vector2
@export var speed: float
@export var ac: float

var velocty: Vector2
var lasPos: Vector2
func setVectorToTarget():
	vectorToTarget = target.position - position

func _ready() -> void:
	setVectorToTarget()

func _process(delta: float) -> void:
	#position = position.move_toward(target.position, speed)
	#if position == target.position:
		#target.generateNewPos(
	
	setVectorToTarget()
	
	velocty = velocty.move_toward(vectorToTarget.normalized(), ac) * speed
	
	lasPos = position
	position += velocty
	
	position = bigKeep.trapVector(position)
	

func hitWall():
	position = lasPos
