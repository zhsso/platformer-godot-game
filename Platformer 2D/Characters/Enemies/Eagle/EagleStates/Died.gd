extends "res://Scripts/State Machine/state.gd"

func enter():
	owner.get_node("anim").play("Died")

func handle_input(event):
	return event

func update(delta):
	pass