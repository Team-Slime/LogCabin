class_name SearchBox extends LineEdit

enum ShowType {
	tree_directory,
	flat_directory
}

@export var group: ShelfGroup

## How the program handle show result
@export var show_type: ShowType

@export var hide_blacklist: Array[Control]

@export_range(0.0, 1.0) var matching_edge: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text_changed.connect(fuzzy_search)


# Tod, iimplement extension search using "*."
func fuzzy_search(keyword: String) -> void:
	print(true)
	var similarity := []
	for child in get_tree().get_nodes_in_group("ShelfItem"):
		similarity.append([child, child.path.get_slice(".", 0).similarity(keyword)])
		similarity.sort_custom(sort_ascending)
		if show_type == ShowType.flat_directory:
			child.visible = false
		else:
			child.visible = (not child is ShelfItem) or similarity.back()[1] > matching_edge
		if not keyword:
			child.visible = true
	print(similarity)
	for group in similarity:
		var link := ItemShortcut.new()
		link.item = group[0]


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
