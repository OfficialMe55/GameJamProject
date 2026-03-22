class_name itemContainer extends PanelContainer

const ITEM_CONTAINER = preload("uid://b71ug03gohb7s")

var myResource: Resource
var myTexture: Texture2D
var myCount: int

static func construct(resource: Resource, texture, count: int) -> itemContainer:
	var newItemContainer: itemContainer = ITEM_CONTAINER.instantiate()
	newItemContainer.myResource = resource
	newItemContainer.myTexture = texture
	newItemContainer.myCount = count
	return newItemContainer
