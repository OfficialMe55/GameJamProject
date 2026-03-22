extends Resource
class_name deco

@export var size: int
@export var myTexture: Texture2D
@export var myIcon: Texture2D
@export var myName: String

@export var Emotion_Trigger: Dictionary[Global.HUMAN, Global.EMOTIONS] = {
	Global.HUMAN.JOE : Global.EMOTIONS.FEAR,
	Global.HUMAN.INFLUENCER : Global.EMOTIONS.FEAR,
	Global.HUMAN.FISHERMAN : Global.EMOTIONS.FEAR,
	Global.HUMAN.BUSINESSMAN : Global.EMOTIONS.FEAR,
	Global.HUMAN.HIKER : Global.EMOTIONS.FEAR,
	Global.HUMAN.CULTIST : Global.EMOTIONS.FEAR,
	Global.HUMAN.INVESTIGATOR : Global.EMOTIONS.FEAR,
	Global.HUMAN.CONVICT: Global.EMOTIONS.FEAR
	}

@export var boostedPeople: Array[Global.HUMAN]
