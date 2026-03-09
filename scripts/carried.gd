extends humanState

@export var EmotionsTimer: Timer

func start():
	human.global_rotate(Vector3(1,0,0), deg_to_rad(180))
	EmotionsTimer.wait_time = 1
	

func update(_delta):
	human.getCarried()
	
func end():
	human.global_rotate(Vector3(1,0,0), deg_to_rad(180))
	EmotionsTimer.wait_time = 5
	
