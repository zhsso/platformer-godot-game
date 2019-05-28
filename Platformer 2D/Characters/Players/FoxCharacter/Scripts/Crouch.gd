extends "res://Scripts/State Machine/state.gd"

func enter() -> void:
	owner.get_node("Anim").play("Crouch");

func handle_input(event):
	if Input.is_action_just_pressed("ui_up"):
		emit_signal("finished","Jump");
		
	return event

func update(delta) -> void:
	if owner.direction.x != 0:
		move(owner.speed/2, owner.direction);
	else:
		move(0,Vector2(0,0));

func move(speed, direction) -> void:
	owner.velocity.x = direction.x * speed
	owner.move_and_slide(owner.velocity, Vector2(0,-1))