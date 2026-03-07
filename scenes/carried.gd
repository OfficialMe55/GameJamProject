extends humanState

func start():
	human.global_rotate(Vector3(1,0,0), deg_to_rad(180))
	

func update(_delta):
	human.getCarried()
	
func end():
	print("wot?")
	human.global_rotate(Vector3(1,0,0), deg_to_rad(180))
	
