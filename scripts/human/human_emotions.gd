extends Node

var Emotions: Array[float] = [0.0, 0.0, 0.0, 0.0, 0.0] 

var orbScene = preload("res://scenes/human/EmotionsOrb.tscn")

var currentEmotion: Global.EMOTIONS = Global.EMOTIONS.FEAR #Variable probably to be removed

@export var body: myHuman
@export var emotionsLabel: Label3D
@export var emotionsTimer: Timer

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	
	
	if Global.DEBUG:
		emotionsLabel.text = "Fear: %s \n Anger: %s \n Sadness: %s \n Boredom: %s \n Happiness: %s" % Emotions

func dropEmotionOrb():
	var instance = orbScene.instantiate()
	print("post")
	instance.emotion = currentEmotion
	add_child(instance)
	instance.global_position = body.global_position
	
	return
	#Cycle through emotions, change it later
	if currentEmotion == Global.EMOTIONS.LOVE:
		currentEmotion = Global.EMOTIONS.FEAR
	else:
		currentEmotion += 1
	
func _on_timer_timeout() -> void:
	dropEmotionOrb()
