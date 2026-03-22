extends Label

@export var myEmotion: Global.EMOTIONS
@export var visibilityTarget: TextureRect

var myVisible = false

func _ready() -> void:
	pass

func assignToDict():
	PlayerData.emotionCountDict[myEmotion][1].append(self)

func changeLabelText(newText):
	text = str(newText)
	if (newText is int and newText <= 0) or (newText == null):
		myVisible = false
	else:
		myVisible = true
	visibilityTarget.visible = myVisible
