extends Area3D

@export var body: myHuman
@export var weight: int


func _on_body_entered(player: myPlayer) -> void:
	body.player = player
	player.interactionBoxes.append(self)


func _on_body_exited(player: myPlayer) -> void:
	player.interactionBoxes.erase(self)

func interact():
	body.changeState(body.carried)
	body.player.carriedHuman = body
	body.player.changeState(body.player.carryingHuman)
