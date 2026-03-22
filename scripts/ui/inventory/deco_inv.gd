class_name itemContainer extends Button

const ITEM_CONTAINER = preload("uid://b71ug03gohb7s")

const SAVE_DATA = preload("uid://cphki3mht1juw")

const DECORATION = preload("uid://b6aj21ev176s3")


@export var nameLabel: Label

var myResource: Resource
var myTexture: Texture2D
var myCount: int

var myName: String

var ui: UiParent

static func construct(resource: deco, myPosInCountArray, ui: UiParent) -> itemContainer:
	var newItemContainer: itemContainer = ITEM_CONTAINER.instantiate()
	newItemContainer.myResource = resource
	newItemContainer.myCount = SAVE_DATA.decoCountArray[myPosInCountArray]
	newItemContainer.myTexture = resource.myTexture
	
	newItemContainer.nameLabel.text = resource.myName
	
	newItemContainer.ui = ui
	
	return newItemContainer

func _on_pressed() -> void:
	print(ui)
	#ui.player.deco_selected(myResource)
