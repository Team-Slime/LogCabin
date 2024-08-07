extends Control
class_name MVU

## Planned:
## - Scene creation DSL (Practically done)
## - A scene watcher i can wrap around the above to update the scene when the
## wrapped value changes (it will hide away the deletion, but you can code the
## addition) (This is mostly to keep the code declarative)

## Signal for when it's done updating the model
signal updated
## Signal for when it's done transforming the model
signal viewed

## The state of the model
var state: Model

func _ready() -> void:
	add_child(root_node)


## Initialize the model
func _init() -> void:
	MessageDispatcher.new_message.connect(do_update)
	state = Model.new()

## Update the model based on message given
func _update(message: Message) -> Model:
	match message.message_type:
		0: state.number += 1
		1: state.number -= 1
	return state

## Tranform the model into viewable experience (No transforming actually)
## As youre just responding from the message, it would be bit inefficient
## to rerender it everytime and like i dont know anything about vdom so yes
func _view(message: Message) -> Control:
	var label = Label.new()
	label.text = str(state.number)
	label.anchors_preset = PRESET_FULL_RECT
	return label


func do_update(message: Message) -> void:
	var new_state = await _update(message)
	updated.emit()
	var new_view = await _view(message)
	viewed.emit()

# Real
func create_node(type, attributes: Dictionary = {}, children: Array[Node] = []):
	var node: Node = type.new()
	for child in children:
		node.add_child(child)
	for key in attributes.keys():
		node.set(key, attributes[key])
	return node

var root_node = create_node(Node2D, {} , [
	create_node(Sprite2D, {"texture": "res://player.png"}, []),
	create_node(CharacterBody2D, {"script": "res://player_controller.gd"}, [
		create_node(CollisionShape2D),
	])
])
