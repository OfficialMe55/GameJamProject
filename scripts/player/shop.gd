extends State

@onready var ui: UiParent = $"../../../CanvasLayer/Ui"

func start():
	ui.shopUi.appear()
	player.velocity = Vector3(0,0,0)

func update(delta):
	pass

func End():
	pass
