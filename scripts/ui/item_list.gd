extends TabContainer

@export var ui: UiParent

@export var deco_item_list: Control
@export var upgade_item_list: Control


# Called when the node enters the scene tree for the first time.
func start():
	for i in range(ui.availableDecoItems.size()):
		print(1)
		print(ui.availableDecoItems)
		deco_item_list.add_child(ItemContainer.createItemContainer(ui.availableDecoItems[i], 1.99, 7))
		
	
	print("z" + str(ui.availableUpgrades.size()))
	for i in range(ui.availableUpgrades.size()):
		
		print(2)
		upgade_item_list.add_child(ItemContainer.createItemContainer(ui.availableUpgrades[i], 5.99, 12))
		
	

func stop():
	for i in range(deco_item_list.get_child_count()):
		deco_item_list.get_child(i).queue_free()
	
	for i in range(upgade_item_list.get_child_count()):
		upgade_item_list.get_child(i).queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
