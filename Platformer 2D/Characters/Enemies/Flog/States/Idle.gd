extends "res://Scripts/State Machine/state.gd"

func enter():
	owner.get_node("anim").play("Idle")
	owner.get_node("time_jump").wait_time = owner.get_node("anim").current_animation_length*9
	owner.get_node("time_jump").start()

func handle_input(event):
	pass

func update(delta):
	pass

func _on_time_jump_timeout():
	emit_signal("finished","Jump")
