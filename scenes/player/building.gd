extends State



func start():
	print("starting build")

func update(_delta):
	player.getInput()
	player.normalMovement()
	player.build()

func End():
	print("ending build")
