extends Area2D

@export var keepInBox: Node

var velocity: Vector2 = Vector2(0,0)
@export var termVelPos: Vector2
@export var termVelNeg: Vector2

@export var acSpeed: Vector2
var direction: int

var lastPos: Vector2

var boost = 0


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
	
	
	#progressACSpeed = move_toward(progressACSpeed, progressDir, .00002)
	
	#print("progressACSpeed: " + str(progressACSpeed))
	progressVel += progressACSpeed
	progressVel = clamp(progressVel, -.05, 1)
	#print("progressVel:     " + str(progressVel))
	var lastProgress = progressBar.value
	progressBar.value += progressVel
	
	if progressBar.value == 100:
		lockProgressBar = true
		if lastProgress != progressBar.value:
			timer.start(2)
	
	# lock progressBar
	if lockProgressBar:
		progressBar.value = 100
		if Input.is_action_just_pressed("chatchFish") and inArea:
			Global.player.changeState(Global.player.default_movement)

func _ready() -> void:
	return
	progressBar = fishing.progressBar


var progressVel = 0
var progressACSpeed = 0
var inArea: bool

@export_group("Progress Bar")
@export var fishing: Node
@onready var progressBar: Node = $"../../ProgressBar"
@export_range(0, .001, .000001) var progressAC: float
@export var timer: Timer

var lockProgressBar: bool = false

func _on_fish_area_entered(area: Area2D) -> void:
	if area == self:
		inArea = true
		progressACSpeed = progressAC


func _on_fish_area_exited(area: Area2D) -> void:
	if area == self:
		inArea = false
		progressACSpeed = -progressAC

func lock_progress_bar_finished() -> void:
	lockProgressBar = false
