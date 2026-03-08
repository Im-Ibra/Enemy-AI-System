extends States
class_name ScoutingState

@onready var enemy: CharacterBody2D = $"../.."
@onready var scouting_timer: Timer = $"../../Timers/Scouting Timer"
@onready var scouting_area: Area2D = $"../../../Scouting Area"

var target

func enter():
	print("Something doesn't look right")
	randomize()
	target = get_random_area_point(scouting_area)
	enemy.look_at(target)


#func _on_scouting_timer_timeout() -> void:
	#if Global.on_enemy_area:
		#state_machine.change_state("Chasing")
	#else:
		#state_machine.change_state("Idle")

func get_random_area_point(area: Area2D) -> Vector2:
	var shape = area.get_node("Area Shape").shape
	var extents = shape.extents
	
	var x = randf_range(-extents.x, extents.x)
	var y = randf_range(-extents.y, extents.y)
	
	var local_point = Vector2(x, y)
	return area.to_global(local_point)
	
func physics_update(delta: float):
	if Global.on_enemy_area:
		state_machine.change_state("Chasing")
	var direction = (target - enemy.position).normalized()
	enemy.velocity = (direction * enemy.walk_speed)
	enemy.move_and_slide()
	if enemy.global_position.distance_to(target) <= 1:
		state_machine.change_state("Idle")
