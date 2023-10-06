class_name MdParser extends Node


var header_six := RegEx.create_from_string("^\\#\\#\\#\\#\\#\\#\\s(.*)")
var header_five := RegEx.create_from_string("^\\#\\#\\#\\#\\#\\s(.*)")
var header_four := RegEx.create_from_string("^\\#\\#\\#\\#\\s(.*)")
var header_three := RegEx.create_from_string("^\\#\\#\\#\\s(.*)")
var header_two := RegEx.create_from_string("^\\#\\#(.*)*|(.*)(?:[\\n])-+")
var header_one := RegEx.create_from_string("^\\#(.*)*|(.*)(?:[\\n])=+")

var bold_italic := RegEx.create_from_string("\\*\\*\\*(.*)\\*\\*\\*|\\_\\_\\_(.*)\\_\\_\\_/gmi")
var bold := RegEx.create_from_string("\\*\\*(.*)\\*\\|\\_\\_(.*)\\_\\_*")
var italic := RegEx.create_from_string("\\*(.*)\\|\\_(.*)\\_*/gmi")

var underline := RegEx.create_from_string("\\_(.*)\\_/gmi")
var strikethrough := RegEx.create_from_string("\\~\\~(.*)\\~\\~/gmi")

var superscript := RegEx.create_from_string("\\^(\\w*)/gmi")
var subscript := RegEx.create_from_string("\\~(.*)\\~/gmi")

var quote := RegEx.create_from_string("\\>(.*)/gmi")

var horizontal_line := RegEx.create_from_string("\\-\\-\\-/gmi")

var code_line := RegEx.create_from_string("\\`(.*)\\`/gmi")
var code_block := RegEx.create_from_string("\\`\\`\\`(.*)\\`\\`\\`/gmi")

var image := RegEx.create_from_string("!\\[([^\\]]+)\\]\\(([^)]+)\\)/gmi")
var link := RegEx.create_from_string("\\[([^\\]]+)\\]\\(([^)]+)\\)/gmi")

## Make list later

func _ready():
	var markdown_text = """
###### Heading
"""
	var bbcode_text = markdown_to_bbcode(markdown_text)
	print(bbcode_text)

func markdown_to_bbcode(markdown: String):
	# https://github.com/feralhosting/feralhosting.github.io/blob/master/b2m/index.html
	markdown = header_six.sub(markdown, "[size=90%]$1[/size]", true)
	markdown = header_five.sub(markdown, "[size=105%]$1[/size]", true)
	markdown = header_four.sub(markdown, "[size=120%]$1[/size]", true)
	markdown = header_three.sub(markdown, "[size=135%]$1[/size]", true)
	markdown = header_two.sub(markdown, "[size=150%]$1[/size][br][hr]", true)
	markdown = header_one.sub(markdown, "[size=170%]$1[/size][br][hr]", true)
	
	markdown = bold.sub(markdown, "[b]$1$2[/b]", true)
	markdown = italic.sub(markdown, "[i]$1$2[/i]", true)
	
	markdown = underline.sub(markdown, "[u]$1[/u]", true)
	markdown = strikethrough.sub(markdown, "[s]$1[/s]", true)
	
	markdown = superscript.sub(markdown, "[sup]$1$2[/sup]", true)
	markdown = subscript.sub(markdown, "[sub]$1$2[/sub]", true)
	
	markdown = quote.sub(markdown, "[quote]$1$2[/quote]", true)
	
	markdown = horizontal_line.sub(markdown, "[hr]", true)
	return markdown


func _on_code_edit_text_changed() -> void:
	$Wysiwyg/Preview.text = $Wysiwyg/CodeEdit.text
