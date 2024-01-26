extends HBoxContainer



var displayed : bool = false

var origin : Vector2
var arbitary_distance : Vector2 = Vector2(125,0)
@export var timer : Timer


#func _ready():
#	origin = position 

func display():
	visible = true
	timer.start()
		
#func start():
#	visible = true
#	var tween = get_tree().create_tween()
#	tween.tween_property(self,"position",origin,1.0).from(origin - arbitary_distance).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
#	displayed = true



func _on_timer_timeout():
	visible = false
#	var tween = get_tree().create_tween()
#	tween.tween_property(self,"position",origin -arbitary_distance,1.0).from(origin).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
#	displayed = false
	
