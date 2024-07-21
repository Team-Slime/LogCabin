extends Resource
class_name MarkdownToken

@export var type: int
@export var content: String


static func of(type: int , content: String):
	var token = MarkdownToken.new()
	token.type = type
	token.content = content
	return MarkdownToken
