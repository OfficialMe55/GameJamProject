extends Control

class_name UiParent

@export var shopUi: Control
@export var player: myPlayer
@export var playerData: PlayerData
@export var inventory: Control
@export var fishing: Node

signal collectedEmotion(emotion)

signal containerOpened(state: bool)

func _ready() -> void:
	PlayerData.ui = self
