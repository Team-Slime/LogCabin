extends Node

var mvu: MVU

signal new_message

func emit_message_signal(message: Message):
	new_message.emit(message)
