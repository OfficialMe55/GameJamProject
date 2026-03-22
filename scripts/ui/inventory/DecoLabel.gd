extends Label

@export var myDeco: Global.DECOS
@export var visibilityTarget: TextureRect

var myVisible = false

func _ready() -> void:
	pass

func assignToDict():
	PlayerData.decoCountDict[myDeco][1].append(self)

func changeLabelText(newText):
	text = str(newText)
	if (newText is int and newText <= 0) or (newText == null):
		myVisible = false
	else:
		myVisible = true
	visibilityTarget.visible = myVisible
