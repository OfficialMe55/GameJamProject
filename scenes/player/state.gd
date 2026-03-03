extends State

func start():
	pass

func update(delta):
	player.normalMovement()

	if Input.is_action_just_pressed("interract") and player.isInInteractionBox:
		print("shit happens")
		player.changeState(player.move_to_point)

func End():
	pass
