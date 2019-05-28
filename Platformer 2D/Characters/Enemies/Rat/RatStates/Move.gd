extends "res://Scripts/State Machine/state.gd"

func enter():
	owner.get_node("anim").play("Walk");

func handle_input(event):
	return event

func update(delta):
	if owner.direction.x == 0:
		emit_signal("finished","Died");
		return
	move(owner.speed, owner.direction);

func move(speed, direction):
	owner.velocity.x = direction.x * speed;
	owner.move_and_slide(owner.velocity, Vector2(0,-1));