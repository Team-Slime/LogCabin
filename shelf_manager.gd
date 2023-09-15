class_name ShelfManager extends ShelfGroup

@export var add_folder: Button
@export var remove_folder: Button
@export var file_dialog: NativeFileDialog


func _ready() -> void:
	add_folder.pressed.connect(func():
		file_dialog.show()
	)
	file_dialog.dir_selected.connect(func(dir: String):
		var folder := ShelfGroup.new()
		add_child(folder)
		folder.path = dir
		folder.margin_setting = margin_setting
		parse_directory(dir, folder)
	)
	remove_folder.pressed.connect(func():
		for child in find_children("*", "ShelfFolder"):
			child.queue_free()
	)
