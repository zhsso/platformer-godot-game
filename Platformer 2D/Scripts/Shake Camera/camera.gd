extends Camera2D

onready var timer : Timer = $Timer
export var amplitude : float = 4.0
export var duration : float = 0.8 setget set_duration
export(float, EASE) var DAMP_EASING = 1.0
var shake : bool = false setget set_shake

func _ready() -> void:
	randomize();
	set_process(false);
	self.duration = duration
	connect_to_shakers()

func _process(delta: float) -> void:
	var damping : float = ease(timer.time_left / timer.wait_time, DAMP_EASING)
	
	offset = Vector2(
		rand_range(amplitude, -amplitude) * damping,
		rand_range(amplitude, -amplitude) * damping)

func _on_camera_shake_requested(new_amplitude) -> void:
	self.shake = true
	self.amplitude = new_amplitude

func set_duration(value: float) -> void:
	duration = value
	timer.wait_time = duration

func set_shake(value: bool) -> void:
	shake = value
	set_process(shake)
	offset = Vector2()
	if shake:
		timer.start()

func connect_to_shakers() -> void:
	get_parent().connect("camera_shake_requested",self,"_on_camera_shake_requested")

func _on_Timer_timeout() -> void:
	self.shake = false
