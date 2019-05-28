extends "res://Characters/Enemies/Enemy.gd"

func _physics_process(delta):
	._apply_gravity(true,delta);
	
	if !$ray_left.is_colliding():
		direction.x = 1
		$spr.flip_h = true
	elif !$ray_right.is_colliding():
		direction.x = -1
		$spr.flip_h = false
	
	if is_on_wall():
		direction.x = 1 if direction.x == -1 else -1
		$spr.flip_h = false if direction.x == -1 else true

func _on_DetectCollision_body_entered(body):
	if body.is_in_group("Characters"):
		body.emit_signal("finished","Damage");

func _on_anim_animation_finished(anim_name):
	if anim_name == "Died":
		queue_free();
