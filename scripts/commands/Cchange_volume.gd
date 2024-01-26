extends Command

class_name CChangeVolume

var object
var amount : int 

func _init(o, a : int  = 1):
	object = o
	amount = a
	
func execute():
	object.change_volume(amount)
	
func undo():
	object.change_volume(-amount)


func _to_string():
	#Will break if object null
	return str("Change volume by ",amount," on ",object.name)
