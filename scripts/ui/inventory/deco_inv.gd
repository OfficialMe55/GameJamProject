class_name itemContainer extends PanelContainer

const ITEM_CONTAINER = preload("uid://b71ug03gohb7s")

const SAVE_DATA = preload("uid://cphki3mht1juw")


var myResource: Resource
var myTexture: Texture2D
var myCount: int

var myName: String

static func construct(resource: deco, myPosInCountArray) -> itemContainer:
	var newItemContainer: itemContainer = ITEM_CONTAINER.instantiate()
	newItemContainer.myResource = resource
	newItemContainer.myCount = SAVE_DATA.decoCountArray[myPosInCountArray]
	newItemContainer.myTexture = resource.myTexture
	
	
	return newItemContainer
