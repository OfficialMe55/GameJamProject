extends State



func start():
	pass

func update(_delta):
	player.getInput()
	player.normalMovement()
	player.interact()

func End():
	pass
