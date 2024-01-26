extends Command

class_name CUndo

var object

func _init(o):
	object = o
	
func execute():
	object.undo()


func _to_string():
	#Will break if object null
	return str("Undo command on ",object.name)
