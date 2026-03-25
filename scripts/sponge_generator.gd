@tool
extends Node3D

@export var textureArray: Array[Texture2D]
@export var size: int
@export var frameThickness: int
@export var NoiseFrequency: float
@export var density: float
@export var minSpongeSize: float
@export var maxSpongeSize: float

const SPONGEHEIGHT = 2



@export var regenerate: bool = false

var noise = FastNoiseLite.new()

func _ready():
	if regenerate:
		ClearSponge()
		SpongeGenerator()



func SpongeGenerator():
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	noise.frequency = NoiseFrequency
	
	var forestSize = Vector2(size, size)
	
	var frameMin = frameThickness
	var frameMax = size - frameThickness
	
	var count = 0
	
	for i in range(int(forestSize.x)):
			for j in range(int(forestSize.y)):
				var n = noise.get_noise_2d(i, j)
				if n > density:
					var isFrame = (i < frameMin or i > frameMax) or (j < frameMin or j > frameMax)
					if isFrame:
						count += 1
						var sprite = Sprite3D.new()
						
						sprite.scale *= randf_range(minSpongeSize, maxSpongeSize)
						var height = SPONGEHEIGHT * sprite.scale.y
						var y_offset = (height - SPONGEHEIGHT) / 2
						sprite.position = Vector3(i, y_offset, j)
						sprite.texture = textureArray.pick_random()
						add_child(sprite)
	print("forest sponge count: ", count)

func ClearSponge():
	for child in get_children():
		child.queue_free()
