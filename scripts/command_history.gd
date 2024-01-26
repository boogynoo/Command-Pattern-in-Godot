extends Node

class_name CommandHistory

# TODO Implement Max Size
var _history : Array[Command]
	
func push(c: Command):
	_history.push_front(c)
	
func pop() -> Command:
	return _history.pop_front()
	
