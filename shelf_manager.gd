class_name ShelfManager extends ShelfGroup

@export var add_folder: Button
@export var remove_folder: Button
@export var file_dialog: NativeFileDialog
@export var file_panel: ScrollContainer

func _ready() -> void:
	add_folder.pressed.connect(func():
		file_dialog.show()
	)
	file_dialog.dir_selected.connect(func(dir: String):
		var item := ShelfItem.new()
		item.path = dir
		file_panel.add_child(item)
		var group := ShelfGroup.new()
		file_panel.add_child(group)
		group.label = item
		group.margin_setting = margin_setting
		group.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		parse_directory(dir, group)
	)
	remove_folder.pressed.connect(func():
		for child in find_children("*", "ShelfGroup"):
			child.queue_free()
		for child in find_children("*", "ShelfItem"):
			child.queue_free()
	)
