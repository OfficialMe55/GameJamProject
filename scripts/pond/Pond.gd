extends Area3D

var playerNode: myPlayer

@export var fishingSpot: Marker3D


@export var weight: int


func _ready():
	pass
	set_process(false)

func _on_body_entered(body: myPlayer) -> void:
	print("player entered")
	playerNode = body
	body.isInInteractionBox = true
	body.interactionBoxes.append(self)


func _on_body_exited(body: myPlayer) -> void:
	print("player left")
	body.isInInteractionBox = false
	body.interactionBoxes.erase(self)

func interract():
	if playerNode.global_position.distance_to(fishingSpot.global_position) > 1:
		print("shit happens")
		playerNode.changeState(playerNode.navigationMovement)
		playerNode.navigationTarget = fishingSpot.global_position
	else:
		print("start fishing!!!!!!!!!")
		print("returning to default movement state, instead of fishing state")
		playerNode.changeState(playerNode.default_movement) #Change to fishing in the future!!
