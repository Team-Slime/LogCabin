class_name ShelfManager extends ShelfGroup

@export var add_folder: Button
@export var remove_folder: Button
@export var file_dialog: FileDialog
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


#func _on_pre_sort_children() -> void:
	#if size.x < 340:
		#$HBoxContainer/DetachAll.visible = false
		#$HBoxContainer/DetachAllSmall.visible = true
		#$HBoxContainer/Import.visible = false
		#$HBoxContainer/ImportSmall.visible = true
	#else:
		#$HBoxContainer/DetachAll.visible = true
		#$HBoxContainer/DetachAllSmall.visible = false
		#$HBoxContainer/Import.visible = true
		#$HBoxContainer/ImportSmall.visible = false
