class_name MdParser extends Node




func _ready():
	var markdown_text = """
	# Header
	**Bold** and *italic* text.
	[Link](https://example.com)
	- List item 1
	- List item 2
	"""
	var bbcode_text = markdown_to_bbcode(markdown_text)
	print(bbcode_text)

func markdown_to_bbcode(markdown_text):
	# https://github.com/feralhosting/feralhosting.github.io/blob/master/b2m/index.html
	var header_six := RegEx.create_from_string("^\\#\\#\\#\\#\\#\\#(.*)*/gmi")
	var header_five := RegEx.create_from_string("^\\#\\#\\#\\#\\#(.*)*/gmi")
	var header_four := RegEx.create_from_string("^\\#\\#\\#\\#(.*)*/gmi")
	var header_three := RegEx.create_from_string("^\\#\\#\\#(.*)*/gmi")
	var header_two := RegEx.create_from_string("^\\#\\#(.*)*/gmi")
	var header_one := RegEx.create_from_string("^\\#(.*)*/gmi")
	
	var bold_italic := RegEx.create_from_string("\\*\\*\\*(.*?)\\*\\*\\*/gmi")
	var bold := RegEx.create_from_string("\\*\\*(.*?)\\*\\*/gmi")
	var italic := RegEx.create_from_string("\\*(.*?)\\*/gmi")
	
	var underline := RegEx.create_from_string("_([^_]+)_/gmi")
	var strikethrough := RegEx.create_from_string("~~([^~]+)~~/gmi")
	
	var code_line := RegEx.create_from_string("\\`(.*?)\\`/gmi")
	var code_block := RegEx.create_from_string("\\`\\`\\`(.*?)\\`\\`\\`/gmi")
	
	var link := RegEx.create_from_string("\\[([^\\]]+)\\]\\(([^)]+)\\)/gmi")
