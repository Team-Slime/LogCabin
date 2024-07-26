extends Resource
class_name MarkdownLexer


static func tokenize(input: String):
	var tokens: Array = [MarkdownToken.new(MarkdownTokenType.START, "")]
	print(tokens)
	var character_array := input.split("")
	for character in character_array:
		print(character)
		var current_type = tokens.back().type
		match character:
			"#":
				match current_type:
					MarkdownTokenType.NEWLINE: tokens.append(MarkdownToken.new(MarkdownTokenType.HEADER_1, character))
					MarkdownTokenType.HEADER_1: tokens = replace(tokens, MarkdownTokenType.HEADER_2, character)
					MarkdownTokenType.HEADER_2: tokens = replace(tokens, MarkdownTokenType.HEADER_3, character)
					MarkdownTokenType.HEADER_3: tokens = replace(tokens, MarkdownTokenType.HEADER_4, character)
					MarkdownTokenType.HEADER_4: tokens = replace(tokens, MarkdownTokenType.HEADER_5, character)
					MarkdownTokenType.HEADER_5: tokens = replace(tokens, MarkdownTokenType.HEADER_6, character)
			"*":
				match current_type:
					MarkdownTokenType.ITALIC: tokens = replace(tokens, MarkdownTokenType.BOLD, character)
					_: tokens.append(MarkdownToken.new(MarkdownTokenType.ITALIC, character))
			"^":
				tokens.append(MarkdownToken.new(MarkdownTokenType.SUPER_SCRIPT, character))
			"_":
				tokens.append(MarkdownToken.new(MarkdownTokenType.UNDERLINE, character))
			"~":
				match current_type:
					MarkdownTokenType.SUB_SCRIPT: tokens = replace(tokens, MarkdownTokenType.STRIKETHROUGH, character)
					_: tokens.append(MarkdownToken.new(MarkdownTokenType.SUB_SCRIPT, character))
			"`":
				tokens.append(MarkdownToken.new(MarkdownTokenType.CODE_BLOCK, character))
			"\n":
				tokens.append(MarkdownToken.new(MarkdownTokenType.NEWLINE, character))
			"\t":
				tokens.append(MarkdownToken.new(MarkdownTokenType.TAB, character))
			" ":
				tokens.append(MarkdownToken.new(MarkdownTokenType.SPACE, character))
			_:
				match current_type:
					MarkdownTokenType.PARAGRAPH: tokens.back().content += character
					_: tokens.append(MarkdownToken.new(MarkdownTokenType.PARAGRAPH, character))
	return tokens


static func replace(tokens: Array, new_type: int, character: String):
	tokens.back().type = new_type
	tokens.back().content += character
	return tokens


static func pretty_print(token_stream: Array):
	return token_stream.reduce(func(accum, data):
		return accum + ", {" + MarkdownTokenType.int_to_token_type(data.type) + ", " + data.content.c_escape() + "}","[") + "]"
