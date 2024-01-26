extends Command

class_name CChangeChannel

var object
var amount : int 

func _init(o, a : int  = 1):
	object = o
	amount = a
	
func execute():
	object.change_channel(amount)
	
func undo():
	object.change_channel(-amount)


func _to_string():
	#Will break if object null
	return str("Change channel by ",amount," on ",object.name)
