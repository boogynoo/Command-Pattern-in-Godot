extends Command


class_name CPause

var object

func _init(obj):
	object = obj
	
func execute():
	object.pause()
	
func undo():
	object.resume()
	
func _to_string():
	#Will break if object null
	return str(object.name," Paused")
