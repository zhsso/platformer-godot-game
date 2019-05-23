extends "res://Scripts/State Machine/state.gd"

func enter():
	owner.get_node("anim").play("Attack");

func handle_input(event):
	return event

func update(delta):
	move(owner.speed, owner.direction, delta);

func move(speed, direction,delta):
	owner.velocity.y = direction.y * speed
	owner.move_and_slide(owner.velocity, Vector2(0,-1))
	return delta