extends State

func start():
	player.ui.fishing.fishingMiniGame()
	player.velocity = Vector3()

func update(_delta):
	pass

func end():
	player.ui.fishing.deleteFishingGame()
	player.world.add_child(myHuman.instantiateHuman(Global.HUMAN.JOE, player.position)) #needs variability
