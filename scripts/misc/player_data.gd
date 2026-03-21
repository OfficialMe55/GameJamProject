extends Node

@export var ui: UiParent

@export var emotionCountDict: Dictionary[Global.EMOTIONS, Array] = {
	Global.EMOTIONS.FEAR: [0, []],
	Global.EMOTIONS.SADNESS: [0, []],
	Global.EMOTIONS.ANGER: [0, []],
	Global.EMOTIONS.BOREDOM: [0, []],
	Global.EMOTIONS.HAPPINESS: [0, []],
	Global.EMOTIONS.LOVE: [0, []]}

var decoCountDict: Dictionary[Global.DECOS, Array] = {
	Global.DECOS.TESTDECO1: [0, []],
	Global.DECOS.TESTDECO2: [0, []]
}

func changeDictCount(dict: Dictionary, emotion: Global.EMOTIONS, amount: int):
	dict.get(emotion)[0] += amount
	
	var testArray:Array = dict.get(emotion)[1]
	
	for i in range(testArray.size()):
		dict.get(emotion)[1][i].changeLabelText(dict.get(emotion)[0] + amount)

func getEmotionCount(emotion: Global.EMOTIONS):
	var temp: Array = emotionCountDict.get(emotion)
	return temp[0]

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
