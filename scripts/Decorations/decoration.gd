extends StaticBody3D



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
	Global.HUMAN.INVESTIGATOR : Global.EMOTIONS.FEAR
	}

func loadSprite(spriteName: String):
	spriteName.replace(SPRITE_FOLDER_PATH, "")
	spriteName.replace(".png", "")
	load(SPRITE_FOLDER_PATH + spriteName + ".png")




	
	#


func _on_influence_area_area_entered(area: Area3D) -> void:
	if area.get_parent() is myHuman:
		var human = area.get_parent()
		human.emotions.currentEmotion = Emotion_Trigger.get(human.myHumanType)
