extends "res://Characters/Enemies/Enemy.gd"

func _physics_process(delta):
	._apply_gravity(true,delta);
	
	if direction.x == 1:
		d = transform;
		d[2].x += 5;
	elif direction.x == -1:
		d = transform;
		d[2].x -= 5;
	
	if !test_move(d,Vector2(5,2)):
		direction.x = -1;
		$spr.flip_h = false;
	elif !test_move(d,Vector2(-5,2)):
		direction.x = 1;
		$spr.flip_h = true;
	
	if is_on_wall():
		if direction.x == -1:
			direction.x = 1;
			$spr.flip_h = true;
		else:
			direction.x = -1;
			$spr.flip_h = false;

func _on_DetectCollision_body_entered(body):
	if body.is_in_group("Characters"):
		body.emit_signal("finished","Damage");

func _on_anim_animation_finished(anim_name):
	if anim_name == "Died":
		queue_free();
