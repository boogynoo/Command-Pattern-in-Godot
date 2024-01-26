extends StaticBody3D

class_name Remote3D
@export var ui_remote : Node
# This should not be link here
@export var ui_historic : Node
@export var audiostream : AudioStreamPlayer3D


func interact():
	if ui_remote:
		ui_remote.visible = !ui_remote.visible
		ui_historic.visible = !ui_historic.visible
		audiostream.play()
