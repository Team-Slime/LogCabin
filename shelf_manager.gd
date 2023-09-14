class_name ShelfManager extends Tree

@onready var root = create_item()

func add_item(item: String, is_directory: bool):
	var new_item := create_item(root)
	new_item.set_text(item)
	new_item.add_button()
