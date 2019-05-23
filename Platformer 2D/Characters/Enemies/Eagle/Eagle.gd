extends "res://Characters/Enemies/Enemy.gd"

func _ready():
	direction.y = 1;

func _physics_process(delta):
	._apply_gravity(true,delta);
	
	if direction.y == 1:
		d = transform;
		d[2].y += 5;
	elif direction.y == -1:
		d = transform;
		d[2].y -= 5;
	
	if test_move(d,Vector2(0,5)):
		direction.y = -1;
	elif !test_move(d,Vector2(0,60)):
		direction.y = 1;

func _on_anim_animation_finished(anim_name):
	if anim_name == "Died":
		queue_free();

