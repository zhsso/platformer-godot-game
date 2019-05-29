extends "res://Characters/Enemies/Enemy.gd"

func _physics_process(delta):
	._apply_gravity(true,delta)
	
	if $raycast_left.is_colliding():
		if $raycast_left.get_collider().is_in_group("Players"):
			direction.x = -1
			$spr.flip_h = false
	
	elif $raycast_right.is_colliding(): 
		if $raycast_right.get_collider().is_in_group("Players"):
			direction.x = 1
			$spr.flip_h = true

func _on_anim_animation_finished(anim_name):
	if anim_name == "Died":
		queue_free()
