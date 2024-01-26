extends HBoxContainer




@export var timer : Timer


func display():
	visible = true
	timer.start()
		

func _on_timer_timeout():
	visible = false

