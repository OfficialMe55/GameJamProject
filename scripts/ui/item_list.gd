extends TabContainer

@export var ui: UiParent

@export var deco_item_list: Control
@export var upgade_item_list: Control


# Called when the node enters the scene tree for the first time.
func start():
	for i in range(ui.availableDecoItems.size()):
		deco_item_list.add_item(str(ui.availableDecoItems[i]))
	
	for i in range(ui.availableUpgrades.size()):
		upgade_item_list.add_item(str(ui.availableUpgrades[i]))
	

func stop():
	deco_item_list.clear()
	upgade_item_list.clear()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
