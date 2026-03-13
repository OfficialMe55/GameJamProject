extends TextureRect

@export var ui: Control
@export var countLabel: Label
@export var myEmotion: Global.EMOTIONS

var myCount = 0

func _ready() -> void:
	pass




func _on_ui_collected_emotion(emotion: Variant) -> void:
	if emotion == myEmotion:
		myCount += 1
		countLabel.text = str(myCount)
