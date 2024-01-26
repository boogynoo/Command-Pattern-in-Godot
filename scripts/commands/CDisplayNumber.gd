extends Command

class_name CDisplayNumber
var object
var number : int 

func _init(o, n : int  = 0):
	object = o
	number = n
	
func execute():
	if !object:
		return
	object.display_number(number)


func _to_string():
	#Will break if object null
	return str("Display number on ",object.name)
