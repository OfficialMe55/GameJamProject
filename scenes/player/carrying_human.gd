extends State



func update(_delta):
	player.getInput()
	player.normalMovement()
	player.dropHuman()
