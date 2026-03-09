extends Node

enum {FEAR, ANGER, SADNESS, BOREDOM, HAPPINESS, LOVE}
var Emotions: Array[float] = [0.0, 0.0, 0.0, 0.0, 0.0] 

var orbScene = preload("res://scenes/human/EmotionsOrb.tscn")

var currentEmotion: int = FEAR #Variable probably to be removed

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
	instance.emotion = currentEmotion
	instance.global_position = body.global_position
	add_child(instance)
	
	#Cycle through emotions, change it later
	if currentEmotion == LOVE:
		currentEmotion = FEAR
	else:
		currentEmotion += 1
	
func _on_timer_timeout() -> void:
	dropEmotionOrb()
