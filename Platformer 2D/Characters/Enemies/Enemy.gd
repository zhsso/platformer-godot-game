extends KinematicBody2D

#warning-ignore:unused_signal
signal finished;

var velocity = Vector2();
var distance = Vector2();
var speed = 26.50;
var gravity = 450;
var direction = Vector2(1,0);
var d;

func _ready():
	return speed or distance;

func _physics_process(delta):
	pass

func _apply_gravity(value,delta):
	if value:
		velocity.y += gravity*delta;
		var move_info = move_and_slide(velocity,Vector2(0,-1))
		
		if is_on_floor():
			velocity.y = 0;
		return move_info;
	else:
		return;

func dead():
	emit_signal("finished","Died");
	velocity = Vector2(0,0);