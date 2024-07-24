extends Resource
class_name MarkdownTokenType
enum {
	START,
	NEWLINE,
	PARAGRAPH,
	TAB,
	HEADER_6,
	HEADER_5,
	HEADER_4,
	HEADER_3,
	HEADER_2,
	HEADER_1,
	SPACE,
	ITALIC,
	BOLD,
	UNDERLINE,
	STRIKETHROUGH,
	SUPER_SCRIPT,
	SUB_SCRIPT,
	QUOTE,
	HORIZONTAL_RULE,
	CODE_BLOCK,
	PARENTHESES,
	BRACKET
}

static func int_to_token_type(integer: int):
	match integer:
		0: return "START"
		1: return "NEWLINE"
		2: return "PARAGRAPH"
		3: return "TAB"
		4: return "HEADER_6"
		5: return "HEADER_5"
		6: return "HEADER_4"
		7: return "HEADER_3"
		8: return "HEADER_2"
		9: return "HEADER_1"
		10: return "SPACE"
		11: return "ITALIC"
		12: return "BOLD"
		13: return "UNDERLINE"
		14: return "STRIKETHROUGH"
		15: return "SUPER_SCRIPT"
		16: return "SUB_SCRIPT"
		17: return "QUOTE"
		18: return "HORIZONTAL_RULE"
		19: return "CODE_BLOCK"
		20: return "PARENTHESES"
		21: return "BRACKET"
	return "Null"
