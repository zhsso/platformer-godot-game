extends KinematicBody2D

signal finished;
signal camera_shake_requested;

var velocity = Vector2();
var distance = Vector2();
var speed = 45.50;
var gravity = 450;
var jump_speed = 180;
var direction = Vector2();

func _ready():
	return speed or distance or jump_speed;

func _physics_process(delta):
	apply_gravity(true,delta);

func _input(event): # F	unción que puede usar un parámetro ""
	direction.x = int(Input.is_action_pressed("ui_right"))-int(Input.is_action_pressed("ui_left"))
	if direction.x != 0:
		get_node("BodyPivot").scale = Vector2(direction.x,1)
	return event

func apply_gravity(value,delta):
	if value:
		velocity.y += gravity*delta
		var move_info = move_and_slide(velocity,Vector2(0,-1))
		
		if is_on_wall():
			pass
		
		if get_slide_count() != 0:
			var body = get_slide_collision(get_slide_count()-1);
			
			if body.normal == Vector2(0,1):
				velocity.y = 0;
			
			if body.normal == Vector2(0,-1) and body.collider.is_in_group("Enemies"):
				body.collider.dead();
				body.collider._apply_gravity(false,null);
				body.collider.set_physics_process(false);
				emit_signal("finished","Jump");
				emit_signal("camera_shake_requested",4.0);
		
		if is_on_floor():
			velocity.y = 0;
			if Input.is_action_just_pressed("ui_up"):
				emit_signal("finished","Jump");
		
		return move_info;
	else:
		return;
