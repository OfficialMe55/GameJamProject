extends Control

class_name UiParent

@export var availableDecoItems: Array[String]
@export var availableUpgrades: Array[String]

@onready var tab_container: TabContainer = $PanelContainer/TabContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func appear():
	visible = true
	tab_container.start()

func disappear():
	visible = false
