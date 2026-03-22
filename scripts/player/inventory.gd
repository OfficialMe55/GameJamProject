extends State

func start():
	player.velocity = Vector3()
	player.ui.inventory.visible = true
	print(player.ui.inventory.visible)

func update(delta):
	if Input.is_action_just_pressed("Inventory"):
		player.changeState(player.default_movement)

func end():
	player.ui.inventory.visible = false
	print(player.ui.inventory.visible)
