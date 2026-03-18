extends Node

const DEBUG: bool = true

const FLOATPRECISION = 1000000

enum EMOTIONS {FEAR, ANGER, SADNESS, BOREDOM, HAPPINESS, LOVE}



enum HUMAN {
	JOE,
	INFLUENCER,
	FISHERMAN,
	BUSINESSMAN,
	HIKER,
	CULTIST,
	INVESTIGATOR,
	CONVICT
	}

const emotionString_to_enum = {
	"fear" = EMOTIONS.FEAR,
	"anger" = EMOTIONS.ANGER,
	"sadness" = EMOTIONS.SADNESS,
	"boredom" = EMOTIONS.BOREDOM,
	"happiness" = EMOTIONS.HAPPINESS,
	"love" = EMOTIONS.LOVE
}

func addFloat(variable, floatComponent) -> float:
	variable = variable * FLOATPRECISION
	floatComponent = round(floatComponent * FLOATPRECISION)
	return (variable+floatComponent)/FLOATPRECISION

func Find_Highest_Index(array: Array):
	var highest = array[0]
	var highestIndex = -1
	var i = -1
	for element in array:
		i+=1
		if element > highest:
			highest = element
			highestIndex = i
	return highestIndex

const DECORATIONS_JSON_PATH = "res://scripts/Decorations/decorations_list.json"
var decorationsJSON: String

func getDecorationsJSON() -> String:
	if decorationsJSON:
		return decorationsJSON
	
	var file = FileAccess.open(DECORATIONS_JSON_PATH, FileAccess.READ)
	if file == null:
		print("ERROR - json file gone from: " + DECORATIONS_JSON_PATH)
		return ""
	decorationsJSON = file.get_as_text()
	file.close()
	return decorationsJSON
	
