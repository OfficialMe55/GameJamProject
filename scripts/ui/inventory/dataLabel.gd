extends Node

@export var myDeco: Global.DECOS


func _ready() -> void:
	PlayerData.decoCountDict[myDeco][1].append(self)
