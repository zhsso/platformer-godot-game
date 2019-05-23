extends "res://Scripts/State Machine/state_machine.gd"

func _ready():
	states_map = {"Attack": $Attack, "Died": $Died}
	.set_active(true);
	change_state("Attack");

func _on_StateMachine_change_state(state_name):
	.change_state(state_name);