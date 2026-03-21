extends Control

class_name UiParent

@export var shopUi: Control
@export var player: myPlayer
@export var playerData: PlayerData

signal collectedEmotion(emotion)

signal containerOpened(state: bool)

func _ready() -> void:
	PlayerData.ui = self
