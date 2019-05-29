extends "res://Scripts/State Machine/state.gd"

func enter():
	owner.get_node("anim").play("Jump")
	owner.velocity.y -= owner.jump_speed
	owner.move_and_slide(owner.velocity, Vector2(0, -1))

func update(delta):
	if owner.is_on_floor():
		emit_signal("finished","Idle")
		owner.velocity = Vector2(0, 0)
		return
	
	move(owner.speed, owner.direction);


func move(speed, direction):
	owner.velocity.x = direction.x * speed;
	owner.move_and_slide(owner.velocity, Vector2(0,-1));