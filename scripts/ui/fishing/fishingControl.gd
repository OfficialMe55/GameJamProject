extends Control

const FISHING = preload("uid://m2ni81y81cwq")

var fishingGame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fishingMiniGame():
	visible = true
	fishingGame = FISHING.instantiate()
	add_child(fishingGame)
	print("added")

func deleteFishingGame():
	visible = false
	remove_child(fishingGame)
	print("removed")
