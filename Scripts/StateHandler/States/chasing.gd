extends States
class_name ChasingState

@onready var enemy: CharacterBody2D = $"../.."
@onready var chasing_timer: Timer = $"../../Timers/Chasing Timer"

func enter():
	Global.can_chase = true
	print("chasing")

func physics_update(delta: float):
	if Global.can_chase:
		var direction = (get_viewport().get_mouse_position() - enemy.position).normalized()
		enemy.velocity = (direction * enemy.chase_speed)
		enemy.look_at(get_viewport().get_mouse_position())
		enemy.move_and_slide()
	else:
		state_machine.change_state("Idle")
