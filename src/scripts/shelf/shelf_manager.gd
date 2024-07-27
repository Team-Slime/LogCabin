class_name ShelfManager extends ShelfGroup

@export var add_folder: Button
@export var remove_folder: Button
@export var file_dialog: FileDialog
@export var file_panel: VBoxContainer

func _ready() -> void:
	add_folder.pressed.connect(func():
		file_dialog.show()
		Message.new(0)
	)
	file_dialog.dir_selected.connect(func(dir: String):
		var root := VBoxContainer.new()
		root.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		file_panel.add_child(root)
		var item := ShelfItem.new()
		item.path = dir
		root.add_child(item)
		var group := ShelfGroup.new()
		root.add_child(group)
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
		Message.new(1)
		print(true)
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
