extends Node

var playerNode: myPlayer

@export var weight: int



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
	playerNode.changeState(playerNode.shop)
	
