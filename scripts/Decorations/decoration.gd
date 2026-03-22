extends StaticBody3D

class_name Decoration

const DECORATIONS_JSON_PATH = "res://scripts/Decorations/decorations_list.json"

const SPRITE_FOLDER_PATH = "res://assets/Decorations/"

const DECORATION = preload("uid://b6aj21ev176s3")

# 
@export var decoName: String
@export var sprite: Sprite3D
@export var size: int
@export var emotionDict: Dictionary

@export var collisionShape: CollisionShape3D

@export var influence_area: Area3D

@export var Emotion_Trigger: Dictionary[Global.HUMAN, Global.EMOTIONS]

var boostedEmotions: Array

var active: bool = true

var decorationsData

var myResource: Resource

func setDecoration(decorationName: String):
	pass

func loadSprite(spriteName: String):
	spriteName.replace(SPRITE_FOLDER_PATH, "")
	spriteName.replace(".png", "")
	sprite.texture = load(SPRITE_FOLDER_PATH + spriteName + ".png")
	

func updateEmotions(decorationName):
	var i = 0
	for human in decorationsData.emotions:
		var newEmotion = Global.emotionString_to_enum[decorationsData.emotions[human]]
		Emotion_Trigger[i] = newEmotion
		i+=1

func _on_influence_area_area_entered(area: Area3D) -> void:
	if not active:
		return
	if area.get_parent() is myHuman:
		var human = area.get_parent()
		human.emotions.currentEmotion = Emotion_Trigger.get(human.myHumanType)

func deactivate():
	active = false
	collisionShape.disabled = true

func activate():
	active = true
	collisionShape.disabled = false

static func construct(resource: deco) -> Decoration:
	var selectedBuilding: Decoration = DECORATION.instantiate()
	selectedBuilding.myResource = resource
	
	return selectedBuilding
	selectedBuilding.sprite.texture = resource.myTexture
	selectedBuilding.collisionShape.scale.x = resource.size
	selectedBuilding.collisionShape.scale.z = resource.size
	
	return selectedBuilding
