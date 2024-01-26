extends Node3D


@export var camera : Camera3D


var left_click = false
signal left_click_on


func _input(event):
	if event.is_action_pressed("left_click"):
		left_click = true
		

func _physics_process(delta):
	if left_click:
		cast_ray()

func cast_ray():
	var space_state = get_world_3d().direct_space_state
	var mouse_position = get_viewport().get_mouse_position()
	

	
	var ray_origin = camera.project_ray_origin(mouse_position)
	var ray_end = ray_origin + camera.project_ray_normal(mouse_position) * 200
	
	var query  = PhysicsRayQueryParameters3D.create(ray_origin,ray_end)
	query.collide_with_areas = true
	var result = space_state.intersect_ray(query)
	if result:
		emit_signal("left_click_on",result)
	left_click = false
	
	
func _on_left_click_on(result):
	#Warning Mega Hack should be patch
	if result.collider.has_method("interact"):
		result.collider.interact()
