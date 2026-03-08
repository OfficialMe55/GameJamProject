extends TabContainer

@onready var ui: UiParent = $"../.."

@onready var deco_item_list: ItemList = $decoItemList
@onready var upgade_item_list: ItemList = $upgadeItemList


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
