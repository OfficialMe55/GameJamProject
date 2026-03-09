extends RigidBody3D

class_name Orb

@export var mesh: MeshInstance3D
@export var sprite: Sprite3D

enum {FEAR, ANGER, SADNESS, BOREDOM, HAPPINESS, LOVE}
var materials: Array[Material] = [
	load("res://shaders/Materials/FearOrb.tres"),
	load("res://shaders/Materials/AngerOrb.tres"),
	load("res://shaders/Materials/SadnessOrb.tres"),
	load("res://shaders/Materials/BoredomOrb.tres"),
	load("res://shaders/Materials/HappinessOrb.tres"),
	load("res://shaders/Materials/LoveOrb.tres")
]

var textures: Array[Texture] = [
	load("res://assets/Emotion Orbs/fear.png") as Texture2D,
	load("res://assets/Emotion Orbs/anger.png") as Texture2D,
	load("res://assets/Emotion Orbs/sadness.png") as Texture2D,
	load("res://assets/Emotion Orbs/boredom.png") as Texture2D,
	load("res://assets/Emotion Orbs/happiness.png") as Texture2D,
	load("res://assets/Emotion Orbs/love.png") as Texture2D
]

var emotion: int = FEAR #be fear by default


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mesh.material_override = materials[emotion]
	sprite.texture = textures[emotion]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
