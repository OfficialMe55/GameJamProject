extends State

func start():
	player.velocity = Vector3()
	player.ui.inventory.visible = true

func update(delta):
	if Input.is_action_just_pressed("Inventory"):
		player.changeState(player.default_movement)

func end():
	player.ui.inventory.visible = false
