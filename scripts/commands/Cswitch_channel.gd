extends Command

class_name CSwitch
var object
var number : int 

func _init(o, n : int  = 0):
	object = o
	number = n
	
func execute():
	if !object:
		return
	object.switch(number)

func _to_string():
	#Will break if object null
	return str(object.name," switched to channel ",number)
