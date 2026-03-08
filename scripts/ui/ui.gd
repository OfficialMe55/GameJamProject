extends Control

class_name UiParent
@onready var player: myPlayer = $"../../Player"

@export var tab_container: TabContainer

@export var availableDecoItems: Array[String]
@export var availableUpgrades: Array[String]




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		disappear()
		player.changeState(player.default_movement)

func appear():
	visible = true
	tab_container.start()

func disappear():
	visible = false
	tab_container.stop()


# money stuff

@export var label: Label
