extends State

func start():
	pass

func update(delta):
	player.getInput()
	player.normalMovement()
	

	#if Input.is_action_just_pressed("interract") and player.isInInteractionBox:
		#
		#player.changeState(player.move_to_point)
		#

func End():
	pass
