extends Stats

@onready var area_shape: CollisionPolygon2D = $"Vision Area/Area Shape"
@onready var chasing_timer: Timer = $"Timers/Chasing Timer"

func _ready() -> void:
	pass

#func _on_vision_area_body_entered(body: Node2D) -> void:
	#Global.on_enemy_area = true
#
#func _on_vision_area_body_exited(body: Node2D) -> void:
	#Global.on_enemy_area = false

func _on_vision_area_mouse_entered() -> void:
	Global.on_enemy_area = true
	area_shape.change_color(Color(Color.RED, 0.3))

func _on_vision_area_mouse_exited() -> void:
	Global.on_enemy_area = false
	area_shape.change_color(Color(Color.GREEN, 0.3))
	chasing_timer.start()
	

func _on_chasing_timer_timeout() -> void:
	Global.can_chase = false
