extends Command


class_name CPlay

var object

func _init(obj):
	object = obj
	
func execute():
	object.resume()
	

func _to_string():
	#Will break if object null
	return str(object.name," Resume")
