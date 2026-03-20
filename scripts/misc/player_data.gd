extends Node

@export var ui: UiParent

@export var emotionCountDict: Dictionary[Global.EMOTIONS, int] = {
	Global.EMOTIONS.FEAR: 0,
	Global.EMOTIONS.SADNESS: 0,
	Global.EMOTIONS.ANGER: 0,
	Global.EMOTIONS.BOREDOM: 0,
	Global.EMOTIONS.HAPPINESS: 0,
	Global.EMOTIONS.LOVE: 0}

var decoCountDict: Dictionary[Global.DECOS, Array] = {
	Global.DECOS.TESTDECO1: [1, []],
	Global.DECOS.TESTDECO2: [0, []]
}

func changeDecoCount(deco: Global.DECOS, amount: int):
	decoCountDict.get(deco)[0] += amount
	
	var testArray:Array = decoCountDict.get(deco)[1]

	for i in range(testArray.size()):
		decoCountDict.get(deco)[1][i].text = str(decoCountDict.get(deco)[0])
	
	#print(testArray.size())
	#print(decoCountDict.get(deco))

func changeEmotionCount(emotion: Global.EMOTIONS, amount: int):
	var stringEm: String = Global.EMOTIONS.keys()[emotion]
	emotionCountDict.set(emotion, emotionCountDict.get(emotion) + 1)
	ui.collectedEmotion.emit(emotion)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interract"):
		changeDecoCount(Global.DECOS.TESTDECO1, 5)
