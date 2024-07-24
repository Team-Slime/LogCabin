extends Node

var tokens: Array[MarkdownToken]

func tokenize(input: String):
	tokens = [MarkdownToken.of(MarkdownTokenType.START, "")]
	var character_array := input.split("")
	for character in character_array:
		match tokens.back().type:
			MarkdownTokenType.START, MarkdownTokenType.NEWLINE:
				# No frontmatter yet
				# I aware i can bring common type outside, but i think it's more
				# readable and indexable this way
				match character:
					"#": tokens.append(MarkdownToken.of(MarkdownTokenType.HEADER_1, character))
					"*": tokens.append(MarkdownToken.of(MarkdownTokenType.ITALIC, character))
					"-": tokens.append(MarkdownToken.of(MarkdownTokenType.HORIZONTAL_RULE, character))
					"^": tokens.append(MarkdownToken.of(MarkdownTokenType.SUPER_SCRIPT, character))
					"_": tokens.append(MarkdownToken.of(MarkdownTokenType.UNDERLINE, character))
					"~": tokens.append(MarkdownToken.of(MarkdownTokenType.SUB_SCRIPT, character))
					"`": tokens.append(MarkdownToken.of(MarkdownTokenType.CODE_BLOCK, character))
					"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					"\t": tokens.append(MarkdownToken.of(MarkdownTokenType.TAB, character))
					_: tokens.append(MarkdownToken.of(MarkdownTokenType.PARAGRAPH, character))
			MarkdownTokenType.PARAGRAPH, MarkdownTokenType.TAB, MarkdownTokenType.WHITESPACE:
				match character:
					"#": tokens.append(MarkdownToken.of(MarkdownTokenType.HEADER_1, character))
					"*": tokens.append(MarkdownToken.of(MarkdownTokenType.ITALIC, character))
					"^": tokens.append(MarkdownToken.of(MarkdownTokenType.SUPER_SCRIPT, character))
					"_": tokens.append(MarkdownToken.of(MarkdownTokenType.UNDERLINE, character))
					"~": tokens.append(MarkdownToken.of(MarkdownTokenType.SUB_SCRIPT, character))
					"`": tokens.append(MarkdownToken.of(MarkdownTokenType.CODE_BLOCK, character))
					"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					"\t": tokens.append(MarkdownToken.of(MarkdownTokenType.TAB, character))
					_: tokens.back().contents += character
			MarkdownTokenType.HEADER_6:
				match character:
					"*": tokens.append(MarkdownToken.of(MarkdownTokenType.ITALIC, character))
					"^": tokens.append(MarkdownToken.of(MarkdownTokenType.SUPER_SCRIPT, character))
					"_": tokens.append(MarkdownToken.of(MarkdownTokenType.UNDERLINE, character))
					"~": tokens.append(MarkdownToken.of(MarkdownTokenType.SUB_SCRIPT, character))
					"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					"\t": tokens.append(MarkdownToken.of(MarkdownTokenType.TAB, character))
					" ": tokens.append(MarkdownToken.of(MarkdownTokenType.WHITESPACE, character))
					_: tokens.append(MarkdownToken.of(MarkdownTokenType.PARAGRAPH, character))
			MarkdownTokenType.HEADER_5:
				match character:
					"#": tokens.append(MarkdownToken.of(MarkdownTokenType.HEADER_6, character))
					"*": tokens.append(MarkdownToken.of(MarkdownTokenType.ITALIC, character))
					"^": tokens.append(MarkdownToken.of(MarkdownTokenType.SUPER_SCRIPT, character))
					"_": tokens.append(MarkdownToken.of(MarkdownTokenType.UNDERLINE, character))
					"~": tokens.append(MarkdownToken.of(MarkdownTokenType.SUB_SCRIPT, character))
					"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					"\t": tokens.append(MarkdownToken.of(MarkdownTokenType.TAB, character))
					" ": tokens.append(MarkdownToken.of(MarkdownTokenType.WHITESPACE, character))
					_: tokens.append(MarkdownToken.of(MarkdownTokenType.PARAGRAPH, character))
			MarkdownTokenType.HEADER_4:
				match character:
					"#": tokens.append(MarkdownToken.of(MarkdownTokenType.HEADER_5, character))
					"*": tokens.append(MarkdownToken.of(MarkdownTokenType.ITALIC, character))
					"^": tokens.append(MarkdownToken.of(MarkdownTokenType.SUPER_SCRIPT, character))
					"_": tokens.append(MarkdownToken.of(MarkdownTokenType.UNDERLINE, character))
					"~": tokens.append(MarkdownToken.of(MarkdownTokenType.SUB_SCRIPT, character))
					"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					"\t": tokens.append(MarkdownToken.of(MarkdownTokenType.TAB, character))
					" ": tokens.append(MarkdownToken.of(MarkdownTokenType.WHITESPACE, character))
					_: tokens.append(MarkdownToken.of(MarkdownTokenType.PARAGRAPH, character))
			MarkdownTokenType.HEADER_3:
				match character:
					"#": tokens.append(MarkdownToken.of(MarkdownTokenType.HEADER_4, character))
					"*": tokens.append(MarkdownToken.of(MarkdownTokenType.ITALIC, character))
					"^": tokens.append(MarkdownToken.of(MarkdownTokenType.SUPER_SCRIPT, character))
					"_": tokens.append(MarkdownToken.of(MarkdownTokenType.UNDERLINE, character))
					"~": tokens.append(MarkdownToken.of(MarkdownTokenType.SUB_SCRIPT, character))
					"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					"\t": tokens.append(MarkdownToken.of(MarkdownTokenType.TAB, character))
					" ": tokens.append(MarkdownToken.of(MarkdownTokenType.WHITESPACE, character))
					_: tokens.append(MarkdownToken.of(MarkdownTokenType.PARAGRAPH, character))
			MarkdownTokenType.HEADER_2:
				match character:
					"#": tokens.append(MarkdownToken.of(MarkdownTokenType.HEADER_3, character))
					"*": tokens.append(MarkdownToken.of(MarkdownTokenType.ITALIC, character))
					"^": tokens.append(MarkdownToken.of(MarkdownTokenType.SUPER_SCRIPT, character))
					"_": tokens.append(MarkdownToken.of(MarkdownTokenType.UNDERLINE, character))
					"~": tokens.append(MarkdownToken.of(MarkdownTokenType.SUB_SCRIPT, character))
					"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					"\t": tokens.append(MarkdownToken.of(MarkdownTokenType.TAB, character))
					" ": tokens.append(MarkdownToken.of(MarkdownTokenType.WHITESPACE, character))
					_: tokens.append(MarkdownToken.of(MarkdownTokenType.PARAGRAPH, character))
			MarkdownTokenType.HEADER_1:
				match character:
					"#": tokens.append(MarkdownToken.of(MarkdownTokenType.HEADER_2, character))
					"*": tokens.append(MarkdownToken.of(MarkdownTokenType.ITALIC, character))
					"^": tokens.append(MarkdownToken.of(MarkdownTokenType.SUPER_SCRIPT, character))
					"_": tokens.append(MarkdownToken.of(MarkdownTokenType.UNDERLINE, character))
					"~": tokens.append(MarkdownToken.of(MarkdownTokenType.SUB_SCRIPT, character))
					"`": tokens.append(MarkdownToken.of(MarkdownTokenType.CODE_BLOCK, character))
					"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					"\t": tokens.append(MarkdownToken.of(MarkdownTokenType.TAB, character))
					" ": tokens.append(MarkdownToken.of(MarkdownTokenType.WHITESPACE, character))
					_: tokens.append(MarkdownToken.of(MarkdownTokenType.PARAGRAPH, character))
			MarkdownTokenType.ITALIC:
				match character:
					"*": tokens = replace(tokens, MarkdownTokenType.BOLD, character)
					"^": tokens.append(MarkdownToken.of(MarkdownTokenType.SUPER_SCRIPT, character))
					"_": tokens.append(MarkdownToken.of(MarkdownTokenType.UNDERLINE, character))
					"~": tokens.append(MarkdownToken.of(MarkdownTokenType.SUB_SCRIPT, character))
					"`": tokens.append(MarkdownToken.of(MarkdownTokenType.CODE_BLOCK, character))
					"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					"\t": tokens.append(MarkdownToken.of(MarkdownTokenType.TAB, character))
					" ": tokens.append(MarkdownToken.of(MarkdownTokenType.WHITESPACE, character))
					_: tokens.append(MarkdownToken.of(MarkdownTokenType.PARAGRAPH, character))
			MarkdownTokenType.BOLD:
				match character:
					"*": tokens.append(MarkdownToken.of(MarkdownTokenType.ITALIC, character))
					"^": tokens.append(MarkdownToken.of(MarkdownTokenType.SUPER_SCRIPT, character))
					"_": tokens.append(MarkdownToken.of(MarkdownTokenType.UNDERLINE, character))
					"~": tokens.append(MarkdownToken.of(MarkdownTokenType.SUB_SCRIPT, character))
					"`": tokens.append(MarkdownToken.of(MarkdownTokenType.CODE_BLOCK, character))
					"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					"\t": tokens.append(MarkdownToken.of(MarkdownTokenType.TAB, character))
					_: tokens.append(MarkdownToken.of(MarkdownTokenType.PARAGRAPH, character))
			MarkdownTokenType.UNDERLINE:
				match character:
					"*": tokens.append(MarkdownToken.of(MarkdownTokenType.ITALIC, character))
					"^": tokens.append(MarkdownToken.of(MarkdownTokenType.SUPER_SCRIPT, character))
					"~": tokens.append(MarkdownToken.of(MarkdownTokenType.SUB_SCRIPT, character))
					"`": tokens.append(MarkdownToken.of(MarkdownTokenType.CODE_BLOCK, character))
					"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					"\t": tokens.append(MarkdownToken.of(MarkdownTokenType.TAB, character))
					_: tokens.append(MarkdownToken.of(MarkdownTokenType.PARAGRAPH, character))
			MarkdownTokenType.SUPER_SCRIPT:
				match character:
					"*": tokens.append(MarkdownToken.of(MarkdownTokenType.ITALIC, character))
					"_": tokens.append(MarkdownToken.of(MarkdownTokenType.UNDERLINE, character))
					"~": tokens.append(MarkdownToken.of(MarkdownTokenType.SUB_SCRIPT, character))
					"`": tokens.append(MarkdownToken.of(MarkdownTokenType.CODE_BLOCK, character))
					"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					"\t": tokens.append(MarkdownToken.of(MarkdownTokenType.TAB, character))
					_: tokens.append(MarkdownToken.of(MarkdownTokenType.PARAGRAPH, character))
			MarkdownTokenType.SUB_SCRIPT:
				match character:
					"*": tokens.append(MarkdownToken.of(MarkdownTokenType.ITALIC, character))
					"^": tokens.append(MarkdownToken.of(MarkdownTokenType.SUPER_SCRIPT, character))
					"_": tokens.append(MarkdownToken.of(MarkdownTokenType.UNDERLINE, character))
					"~": tokens = replace(tokens, MarkdownTokenType.STRIKETHROUGH, character)
					"`": tokens.append(MarkdownToken.of(MarkdownTokenType.CODE_BLOCK, character))
					"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					"\t": tokens.append(MarkdownToken.of(MarkdownTokenType.TAB, character))
					_: tokens.append(MarkdownToken.of(MarkdownTokenType.PARAGRAPH, character))
			MarkdownTokenType.HORIZONTAL_RULE:
				match character:
					"*": tokens.append(MarkdownToken.of(MarkdownTokenType.ITALIC, character))
					"^": tokens.append(MarkdownToken.of(MarkdownTokenType.SUPER_SCRIPT, character))
					"_": tokens.append(MarkdownToken.of(MarkdownTokenType.UNDERLINE, character))
					"~": tokens.append(MarkdownToken.of(MarkdownTokenType.SUB_SCRIPT, character))
					"`": tokens.append(MarkdownToken.of(MarkdownTokenType.CODE_BLOCK, character))
					"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					"\t": tokens.append(MarkdownToken.of(MarkdownTokenType.TAB, character))
					_: tokens.append(MarkdownToken.of(MarkdownTokenType.PARAGRAPH, character))
			MarkdownTokenType.CODE_BLOCK:
				match character:
					"`": tokens.append(MarkdownToken.of(MarkdownTokenType.CODE_BLOCK, character))
					"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					_: tokens.append(MarkdownToken.of(MarkdownTokenType.CODE_CONTENT, character))
			MarkdownTokenType.CODE_CONTENT:
				match character:
					"`": tokens.append(MarkdownToken.of(MarkdownTokenType.CODE_BLOCK, character))
					"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					_: tokens.append(MarkdownToken.of(MarkdownTokenType.PARAGRAPH, character))
			#MarkdownTokenType.PARENTHESES:
				#match character:
					#"\n": tokens.append(MarkdownToken.of(MarkdownTokenType.NEWLINE, character))
					#"\t": tokens.append(MarkdownToken.of(MarkdownTokenType.TAB, character))
					#_: tokens.append(MarkdownToken.of(MarkdownTokenType.PARAGRAPH, character))

func replace(tokens: Array[MarkdownToken], new_type: int, character: String):
	tokens.back().type = new_type
	tokens.back().content += character
	return tokens

func is_hash(character: String): return true if character == "#" else false
func is_star(character: String): return true if character == "*" else false
func is_line(character: String): return true if character == "-" else false
func is_arrow(character: String): return true if character == "^" else false
func is_tilde(character: String): return true if character == "~" else false
func is_tick(character: String): return true if character == "`" else false
