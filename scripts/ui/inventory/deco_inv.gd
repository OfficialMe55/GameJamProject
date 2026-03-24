class_name itemContainer extends PanelContainer

const ITEM_CONTAINER = preload("uid://b71ug03gohb7s")

const SAVE_DATA = preload("uid://cphki3mht1juw")

const DECORATION = preload("uid://b6aj21ev176s3")


@export var nameLabel: Label
@export var count_label: Label
@export var textureNode: TextureRect

var myResource: Resource
var myTexture: Texture2D
var myCount: int

var myName: String

var ui: UiParent

static func construct(resource: deco, myPosInCountArray, ui: UiParent) -> itemContainer:
	var newItemContainer: itemContainer = ITEM_CONTAINER.instantiate()
	newItemContainer.myResource = resource
	
	newItemContainer.count_label.text = str(SAVE_DATA.decoCountArray[myPosInCountArray])
	newItemContainer.textureNode.texture = resource.myIcon
	
	newItemContainer.nameLabel.text = resource.myName
	
	return newItemContainer

func _on_pressed() -> void:
	PlayerData.ui.player.deco_selected(myResource)
