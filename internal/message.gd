extends Resource
class_name Message

enum MessageType {
	Increment,
	Decrement
}

var message_type: MessageType



func _init(new_message_type: MessageType) -> void:
	self.message_type = new_message_type
	MessageDispatcher.emit_message_signal(self)
