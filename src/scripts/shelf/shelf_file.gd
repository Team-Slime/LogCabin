class_name ShelfItem extends Button

@export var path: String :
	set(value):
		text = value.get_file()
		name = value.get_file()
		path = value


@export var group: ShelfGroup


func _ready() -> void:
	alignment = HORIZONTAL_ALIGNMENT_LEFT
	text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
