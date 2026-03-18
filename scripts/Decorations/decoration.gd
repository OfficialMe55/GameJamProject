extends StaticBody3D

class_name Decoration

const DECORATIONS_JSON_PATH = "res://scripts/Decorations/decorations_list.json"

const SPRITE_FOLDER_PATH = "res://assets/Decorations/"

@export var decoName: String

@export var influence_area: Area3D

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


var decorationsData

func setDecoration(decorationName: String):
	
	var json = JSON.new()
	var error = json.parse(Global.getDecorationsJSON())
	
	if not error == OK:
		print("JSON Parse Error: ", json.get_error_message(), " in decorationsJSON at line ", json.get_error_line())
		return

	decorationsData = json.data[decorationName]
	loadSprite(decorationName)
	updateEmotions(decorationName)

func loadSprite(spriteName: String):
	spriteName.replace(SPRITE_FOLDER_PATH, "")
	spriteName.replace(".png", "")
	load(SPRITE_FOLDER_PATH + spriteName + ".png")

func updateEmotions(decorationName):
	var i = 0
	for human in decorationsData.emotions:
		var newEmotion = Global.emotionString_to_enum[decorationsData.emotions[human]]
		Emotion_Trigger[i] = newEmotion
		i+=1

func _on_influence_area_area_entered(area: Area3D) -> void:
	if area.get_parent() is myHuman:
		var human = area.get_parent()
		human.emotions.currentEmotion = Emotion_Trigger.get(human.myHumanType)
