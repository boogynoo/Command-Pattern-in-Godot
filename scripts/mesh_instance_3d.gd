extends MeshInstance3D

class_name Screen

@export var viewport: SubViewport # Could instead get a child with an @onready

# Hack from https://github.com/godotengine/godot/issues/66247#issuecomment-1483786200
# Beacause otherwise it's pain i nthe ass to have a viewport as texture imported in another scene



func _ready() -> void:
	RenderingServer.frame_post_draw.connect(on_draw.bind())
	
	
func on_draw() -> void:
	var tex = viewport.get_texture()
	var mat = get_surface_override_material(0)
	mat.set_shader_parameter("TEXTURE", tex)
	set_surface_override_material(0, mat)
	RenderingServer.frame_post_draw.disconnect(on_draw.bind())
