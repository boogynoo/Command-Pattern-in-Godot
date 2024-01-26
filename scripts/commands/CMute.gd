extends Command

class_name CMute

var object

func _init(o):
	object = o
	
func execute():
	object.mute()
	
func undo():
	object.mute()

func _to_string():
	#Will break if object null
	return str(object.name," Muted")
