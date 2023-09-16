class_name ShelfItem extends Button

@export var path: String :
	set(value):
		text = value
		name = value
		path = value

@export var group: ShelfGroup


func _ready() -> void:
	alignment = HORIZONTAL_ALIGNMENT_LEFT
