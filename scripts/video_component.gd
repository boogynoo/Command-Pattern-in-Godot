extends Node3D
class_name VideoComponent

# This class and scene composition is kind of mess
# Videostream are not well supported.
# Working with subviewport is pain in the ass


@export var screen : Screen
@export var video : VideoStreamPlayer
@export var audio : AudioStreamPlayer3D
@export var viewport : SubViewport
@export var loop : bool = false
@export var video_view_port : SubViewport





func play_video(filepath : String):
	set_video(filepath)
	play()

func play():
	video.play()
	audio.play()

func pause():
	video.paused =true
	audio.stream_paused = true
	
func resume():
	video.paused = false
	audio.stream_paused = false


func stop():
	audio.stop()
	video.stop()


func set_video(filename : String) :
	if filename.get_extension() != "ogg":
		return
		
	var stream  = video.stream
	video.stop()
	stream.set_file(filename)
	video.set_stream(stream)
	# You have to rezie the viewport size otherwise video is not render correctly
#	var size = video.get_video_texture().get_size()
#	viewport.set_size(size)
#	$SubViewport/SubViewportContainer.size = size
#	print(size)
	video.play()
	
	audio.stream = load(filename)


func _on_video_stream_player_finished():
	if loop:
		play()
