extends Control

const path: String = "res://resourcers/decos/"

func _ready() -> void:
	var dir = DirAccess.open("res://resourcers/decos/")
	
	if dir:
		dir.list_dir_begin()
		
		var file_name = dir.get_next()
		while file_name != "":
			
			var path = "res://resourcers/decos/" + file_name
			var res = load(path)
			print(res.resource_path)
			if res:
				pass#funtion
				
				print(res.resource_name)
			
			file_name = dir.get_next()
		
		dir.list_dir_end()
