extends TextureRect

@export var ui: UiParent
@export var countLabel: Label
@export var myEmotion: Global.EMOTIONS

func _ready() -> void:
	visible = false


func _on_ui_collected_emotion(emotion: Variant) -> void:
	if emotion == myEmotion:
		visible = true
		countLabel.text = str(ui.playerData.emotionCountDict.get(myEmotion))
