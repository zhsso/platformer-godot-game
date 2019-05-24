extends "res://Scripts/Inventory/ItemModel.gd"

func _ready():
	$anim_mov.play("Mov");


func _on_detect_body_entered(body):
	if body.is_in_group("Players"):
		body.emit_signal("camera_shake_requested",1.6);
		$anim_pop.visible = true;
		$anim_pop.play("default");

func _on_anim_pop_animation_finished():
	queue_free();