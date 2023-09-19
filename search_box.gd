class_name SearchBox extends LineEdit

enum ShowType {
	tree_directory,
	flat_directory
}

@export var group: ShelfManager

## How the program handle show result
@export var show_type: ShowType

@export var hide_blacklist: Array[Control]

var focusable : Array = []
var _current_focused := 0

@export_range(0.0, 1.0) var matching_edge: float


# Tod, iimplement extension search using "*."
func fuzzy_search(keyword: String) ->void:
	print(true)
	var similarity := []
	for child in get_tree().get_nodes_in_group("ShelfItem"):
		similarity.append([child, child.path.get_slice(".", 0).similarity(keyword)])
		if show_type == ShowType.flat_directory:
			child.visible = false
		else:
			child.visible = (not child is ShelfItem) or similarity.back()[1] > matching_edge
		if not keyword:
			child.visible = true
	if show_type == ShowType.flat_directory:
		similarity.sort_custom(sort_ascending)
		for last in get_tree().get_nodes_in_group("ItemShortcut"):
			last.queue_free()
		for item in similarity:
			var link := ItemShortcut.new()
			link.item = item[0]
			link.alignment = HORIZONTAL_ALIGNMENT_LEFT
			link.add_to_group("ItemShortcut")
			group.file_panel.add_child(link)
	focusable = similarity


func sort_ascending(a: Array, b: Array):
	if a[1] < b[1]:
		return true
	return false


## Math moment ( I will never )
func levenstein_distance(match1: String, match2: String) -> int:
	if match1.is_empty(): return match2.length()
	if match2.is_empty(): return match1.length()
	print(match1.length(), match2.length())
	if match1.left(1).match(match2.left(1)):
		return levenstein_distance(match1.erase(0, 1), match2.erase(0, 1))
	var u := levenstein_distance(match1, match2.erase(1))
	var v := levenstein_distance(match1.erase(1), match2)
	var w := levenstein_distance(match1.erase(1), match2.erase(1))
	return 1 + min(u, v, w)
