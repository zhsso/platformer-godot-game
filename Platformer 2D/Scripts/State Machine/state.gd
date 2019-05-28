extends Node

signal finished(next_state_name);

func enter():
	emit_signal("finished");

func update(delta):
	return delta;

func handle_input(evemt):
	return evemt;