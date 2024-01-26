extends Node3D
class_name Tv

#It is a fake tv, it's more like a computer with some moviens on 

@export var screen : Screen
@export var video_component : VideoComponent
@export var audio : AudioStreamPlayer3D
@export var audio_ui : Node
@export var channel_ui : Node
@export var channels : Dictionary
@export var timer_switch : Timer
var history_channel : Array[int]



var channel_index : int  = 1


var on : bool = false
@export var auto_load : bool = false

func _ready():
	if auto_load:
		power()
	

# BASE
func power():
	if on:
		turn_off()
		return
	turn_on()
	
func turn_on():
	on = true
	play_channel(channel_index)
	screen.visible = true
	
func turn_off():
	on = false
	screen.visible = false
	video_component.stop()



#SOUNDS

func change_volume(amount):
	if !on:
		return
	audio.volume_db = clampf(audio.volume_db + amount, 0.0,30.0)
	audio_ui.get_node("Label").text = str(audio.volume_db)
	audio_ui.display()
	
	
func mute():
	if !on:
		return
	audio.stream_paused = !audio.stream_paused


#VIDEOS
var acc = ""
func switch(i : int ):
	if !on:
		return
		
	acc += str(i)
	channel_ui.get_node("Label").text = str(acc)
	channel_ui.display()
	timer_switch.start()
	

func _on_switch_timer_timeout():
	play_channel(acc.to_int())
	acc = ""
	pass # Replace with function body.
	
	
func display_number(number : int):
	channel_ui.get_node("Label").text = str(number)
	channel_ui.display()

func change_channel(amount : int):
	if !on:
		return
	play_channel(channel_index + amount)
	channel_ui.get_node("Label").text = str(channel_index)
	channel_ui.display()

func pause():
	if !on:
		return
	video_component.pause()

func play():
	if !on:
		return
	video_component.play()

func resume():
	if !on:
		return
	video_component.resume()

#func back():
#	play_channel(history_channel.pop_front())
#

func play_channel(i : int ):
	history_channel.push_front(channel_index)
	var filepath = channels.get(i)
	channel_index = i
	if filepath == null:
		print_debug("There is no channel "+str(i)+" on this tv")
		video_component.stop()
		return
	video_component.play_video(filepath)
	




