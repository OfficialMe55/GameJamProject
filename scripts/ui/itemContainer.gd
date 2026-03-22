extends PanelContainer

class_name ItemContainer 
@export var nameLabel: Label
@export var prizeLabel: Label
@export var stockLabel: Label

var itemName: String
var prize: float
var stock: int

const ITEM_CONTAINER = preload("uid://b8dl1485eor1d")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nameLabel.text = itemName
	prizeLabel.text = str(prize)
	stockLabel.text = str(stock)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

static func createItemContainer(itemName: String, prize: float, stock: int) -> ItemContainer: ##ATTENTION OLD !!!!
	var new_item_container: ItemContainer = ITEM_CONTAINER.instantiate()
	new_item_container.itemName = itemName
	new_item_container.prize = prize
	new_item_container.stock = stock
	return new_item_container
