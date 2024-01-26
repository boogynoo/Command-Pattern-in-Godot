extends Command


class_name CPower

var object

func _init(obj : Node):
	object = obj
	
func execute():
	object.power()
	
func undo():
	object.power()
	

func _to_string():
	#Will break if object null
	return str("Power on "+object.name)
