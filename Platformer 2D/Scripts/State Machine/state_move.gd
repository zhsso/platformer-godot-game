extends "res://Scripts/State Machine/state.gd"

func enter():
	owner.get_node("Anim").play("Move");

func handle_input(event):
	return event;

func update(delta):
	if owner.direction.x == 0:
		emit_signal("finished","Idle");
	
	if owner.is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			emit_signal("finished","Jump");
			return
	
	move(owner.speed, owner.direction);


func move(speed, direction):
	owner.velocity.x = direction.x * speed;
	owner.move_and_slide(owner.velocity, Vector2(0,-1));