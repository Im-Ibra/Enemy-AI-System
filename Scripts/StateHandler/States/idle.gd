extends States
class_name IdleState

@onready var idle_timer: Timer = $"../../Timers/Idle Timer"

func enter():
	print("Currently Idle")
	idle_timer.start()

func _on_idle_timer_timeout() -> void:
	state_machine.change_state("Scouting")
