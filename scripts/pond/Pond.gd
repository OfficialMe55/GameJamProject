extends Area3D

var playerNode: myPlayer

@export var fishingSpot: Marker3D
@export var parent: StaticBody3D

@export var weight: int

@onready var gridMapRoot: GridMapRoot = $"../.."
	
func _on_body_entered(body: myPlayer) -> void:
	print("player entered")
	playerNode = body
	body.isInInteractionBox = true
	body.interactionBoxes.append(self)


func _on_body_exited(body: myPlayer) -> void:
	print("player left")
	body.isInInteractionBox = false
	body.interactionBoxes.erase(self)

func interact():
	if playerNode.global_position.distance_to(fishingSpot.global_position) > 1:
		print("shit happens")
		playerNode.changeState(playerNode.navigationMovement)
		playerNode.navigationTarget = fishingSpot.global_position
	else:
		playerNode.changeState(playerNode.fishing)
