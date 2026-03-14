extends Node

class_name Decoration

const SPRITE_FOLDER_PATH = "res://assets/Decorations/"

var decoName = "idol"



enum EMOTIONS {FEAR, ANGER, SADNESS, BOREDOM, HAPPINESS, LOVE}
#@export var Emotion_Trigger: Dictionary = {
	#"Joe" = BOREDOM,
	#"influencer" = BOREDOM,
	#"fisherman" = BOREDOM,
	#"businessman" = BOREDOM,
	#"hiker" = BOREDOM,
	#"cultist" = BOREDOM,
	#"investigator" = BOREDOM
#}

func _ready():
	pass

func loadSprite(spriteName: String):
	spriteName.replace(SPRITE_FOLDER_PATH, "")
	spriteName.replace(".png", "")
	load(SPRITE_FOLDER_PATH + spriteName + ".png")
