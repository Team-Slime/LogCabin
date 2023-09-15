class_name ShelfGroup extends VBoxContainer

@export var path: String

@export var margin_setting: Theme


func parse_directory(path: String, folder: ShelfGroup):
	var dir = DirAccess.open(path)
	dir.list_dir_begin()
	var found = dir.get_next()
	while found != "":
		var item = folder.add_item(found, dir.current_is_dir())
		if dir.current_is_dir():
			print("Folder:", found)
			item.parse_directory(path + "/" + found, item)
		else: print("File:", found)
		found = dir.get_next()
	dir.list_dir_end()


func add_item(path: String, is_directory: bool) -> Control:
	var item
	if is_directory:
		var margin := MarginContainer.new()
		margin.theme = margin_setting
		add_child(margin)
		item = ShelfGroup.new()
		item.path = path
		item.margin_setting = margin_setting
		margin.add_child(item)
		var label := ShelfItem.new()
		item.path = path
		item.add_child(label)
	else:
		item = ShelfItem.new()
		item.path = path
		add_child(item)
	return item


