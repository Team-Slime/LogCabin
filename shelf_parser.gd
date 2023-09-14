class_name ShelfParser extends FileDialog



@export var shelf_manager: ShelfManager

func _ready() -> void:
	dir_selected.connect(Callable(self, "parse_directory"))


func parse_directory(path: String):
	var dir = DirAccess.open(path)
	assert(not dir, "The directory doesn't exist!")
	assert(dir.list_dir_begin() != OK, "Oh noes!")
	var found = dir.get_next()
	while found != "":
		shelf_manager.add_item(found, dir.current_is_dir())
		if dir.current_is_dir():
			parse_directory(path + "/" + found)
	dir.list_dir_end()
