extends "res://Scripts/State Machine/state.gd"

func enter():
	owner.get_node("anim").play("Died")