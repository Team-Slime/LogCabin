class_name ItemShortcut extends Button


@export var item: ShelfItem :
	set(value):
		var a = value.group.root.label.path
		text = value.path.trim_prefix("m")
		item = value
