extends State



func update(_delta):
	player.getInput()
	player.normalMovement()
	
	#state change
	
	if Input.is_action_just_pressed("interract"):
		player.dropHuman()
