extends Node

class_name Invoker

var history : CommandHistory = CommandHistory.new()



func execute_command(command, save : bool = true):
	if !command:
		return
	command.execute()
	if !save:
		return
	history.push(command)
	
func undo():
	var command = history.pop()
	if command:
		command.undo()
