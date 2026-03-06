extends Area3D

var playerInRange: bool = false

@export var points: Node
@export var weight: int

func _ready():
	pass
	set_process(false)

func _on_body_entered(body: myPlayer) -> void:
	print("player entered")
	playerInRange = true
	body.isInInteractionBox = true
	body.interactionBoxes.append(self)
	set_process(true)


func _on_body_exited(body: myPlayer) -> void:
	print("player left")
	body.isInInteractionBox = false
	playerInRange = false
	set_process(false)

func _process(_delta: float) -> void:
	if playerInRange and Input.is_action_just_pressed("interract"):
		print("shit happens")
		pass
