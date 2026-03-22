extends Control

const path: String = "res://resourcers/decos/"

@onready var targetGrid: GridContainer = $PanelContainer/MarginContainer/GridContainer ## destination for new deco items


func _ready() -> void:
	var dir = DirAccess.open("res://resourcers/decos/")
	
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		var i = 0
		while file_name != "":
			
			var path = "res://resourcers/decos/" + file_name
			var res:Resource = load(path)
			print(res.resource_path)
			if res:
				targetGrid.add_child(itemContainer.construct(res, i))
				i += 1
			
			file_name = dir.get_next()
		
		dir.list_dir_end()
