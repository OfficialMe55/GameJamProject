extends Node

class_name PlayerData

#@export var fearCount = 0
#@export var sadnessCount = 0
#@export var angerCount = 0
#@export var boredomCount = 0
#@export var happynessCount = 0
#@export var loveCount = 0

@export var ui: UiParent

@export var emotionCountDict: Dictionary = {Global.EMOTIONS.FEAR: 0, Global.EMOTIONS.SADNESS: 0, Global.EMOTIONS.ANGER: 0, Global.EMOTIONS.BOREDOM: 0, Global.EMOTIONS.HAPPINESS: 0, Global.EMOTIONS.LOVE: 0}

func changeEmotionCount(emotion: Global.EMOTIONS, amount: int):
	var stringEm: String = Global.EMOTIONS.keys()[emotion]
	emotionCountDict.set(emotion, emotionCountDict.get(emotion) + 1)
	ui.collectedEmotion.emit(emotion)
