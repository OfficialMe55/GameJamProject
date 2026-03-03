extends Area3D

var playerInRange: bool = false

func _ready():
	pass
	set_process(false)

func _on_body_entered(body: myPlayer) -> void:
	print("player entered")
	playerInRange = true
	body.isInInteractionBox = true
	set_process(true)


func _on_body_exited(body: myPlayer) -> void:
	print("player left")
	body.isInInteractionBox = false
	playerInRange = false
	set_process(false)

func _process(_delta: float) -> void:
	#if playerInRange and Input.is_action_just_pressed("interract"):
	#if Input.is_action_just_pressed("interract"):
		#print("shit happens")
		pass
