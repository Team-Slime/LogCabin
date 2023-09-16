class_name ShelfGroup extends VBoxContainer

@export var margin_setting: Theme

## TODO: Implement both VBoxContainer and MarginContainer behavior later

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
		var label := ShelfItem.new()
		label.path = path
		label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		label.add_to_group("ShelfItem")
		add_child(label)
		var margin := MarginContainer.new()
		margin.theme = margin_setting
		add_child(margin)
		item = ShelfGroup.new()
		item.margin_setting = margin_setting
		margin.add_child(item)
		label.group = item
	else:
		item = ShelfItem.new()
		item.path = path
		item.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		item.add_to_group("ShelfItem")
		add_child(item)
	return item


