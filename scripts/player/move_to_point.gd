extends State

var pointsArray: Array

var currentInterBox: Area3D
var currentPoint: Marker3D

var moveVector: Vector3
var stopVector: Vector3

func start():
	
	var biggestWeight = 0
	
	for i in range(player.interactionBoxes.size()): #gets the interbox with the highest weight
		if player.interactionBoxes[i].weight > biggestWeight:
			currentInterBox = player.interactionBoxes[i]
			print(currentInterBox.weight)
	
	currentPoint = currentInterBox.points.get_child(0)
	changePoint()
	
	print("shit happens")

func update(delta):
	player.direction = Vector3(moveVector.x, 0, moveVector.z).normalized()
	player.normalMovement()
	
	if stopVector.x ==  1 and currentPoint.global_position.x - player.global_position.x < 0:
		currentPoint = currentPoint.nextPoint
		changePoint()
	if stopVector.x == -1 and currentPoint.global_position.x - player.global_position.x > 0:
		currentPoint = currentPoint.nextPoint
		changePoint()

func End():
	pass

func changePoint():
	moveVector = currentPoint.global_position - player.global_position
	if currentPoint.global_position.x - player.global_position.x > 0:
		stopVector.x = 1
	else:
		stopVector.x = -1
	
	if currentPoint.global_position.y - player.global_position.y > 0:
		stopVector.y = 1
	else:
		stopVector.y = -1
