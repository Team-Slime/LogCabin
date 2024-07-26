extends Resource
class_name MarkdownToken

@export var type: int
@export var content: String

func _init(new_type: int , new_content: String) -> void:
	type = new_type
	content = new_content
