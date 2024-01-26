extends Control
#The Sender class (aka invoker) is responsible for initiating requests.
# This class must have a field for storing a reference to a command object. 
#The sender triggers that command instead of sending the request directly to 
#the receiver. Note that the sender isn’t responsible for creating the command object. 
#Usually, it gets a pre-created command from the client via the constructor
class_name SmartRemote
@export var audiostream : AudioStreamPlayer
var commands : Array 
@export var associated_object : Node
var invoker : Invoker = Invoker.new()

enum BUTTON {POWER,SOURCE,NUMBERS,MUTE,CUP,CDOWN,VUP,VDOWN,UNDO,LETTERS,PLAY,PAUSE}
@export var mapping : Array[BUTTON]

@export var timer_input : Timer

func _ready():
	#Allow the remote to have 100 buttons
	commands.resize(99)
	if associated_object:
		associate_to(associated_object)


#Ugly but it's working, should be more modular
func associate_to(object):
	associated_object = object
	commands[BUTTON.POWER] = CPower.new(object)
	commands[BUTTON.UNDO] = CUndo.new(invoker)
	commands[BUTTON.MUTE] = CMute.new(object)
	commands[BUTTON.NUMBERS] = CSwitch.new(object)
	commands[BUTTON.PAUSE] = CPause.new(object)
	commands[BUTTON.PLAY] = CPlay.new(object)
	commands[BUTTON.VUP] = CChangeVolume.new(object,1)
	commands[BUTTON.VDOWN] = CChangeVolume.new(object,-1)
	commands[BUTTON.CUP] = CChangeChannel.new(object,1)
	commands[BUTTON.CDOWN] = CChangeChannel.new(object,-1)


var accumulated = ""

func _on_number_pressed(button):
	if timer_input.time_left == 0:
		accumulated = ""
	timer_input.start()
	accumulated += button.name
	invoker.execute_command(CDisplayNumber.new(associated_object, accumulated.to_int()))

func convert_button_signal(index):
	return mapping[index]



func _on_buttons_button_pressed(button,index):
	audiostream.play()

	#This check should not be done and should be erased
	if associated_object == null:
		return
	var converted_i = convert_button_signal(index)
	match converted_i:
		BUTTON.NUMBERS:
			commands[converted_i].number = button.name.to_int()
			invoker.execute_command(commands[converted_i])
		BUTTON.LETTERS:
			pass
		BUTTON.UNDO:
			#Here I execute the command but ask the invoker do not save
			# this command in history
			invoker.execute_command(commands[converted_i],false)
		_:
			invoker.execute_command(commands[converted_i])
