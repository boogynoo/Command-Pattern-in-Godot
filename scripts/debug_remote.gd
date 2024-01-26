extends VBoxContainer

@export var remote : SmartRemote
@export var max : int = 5
func purge():
	for c in get_children():
		c.queue_free()

func display():
	var x = 0
	for command in remote.invoker.history._history:
		if x == 5:
			break
		var label = Label.new()
		label.clip_text = true
		label.text = str(command)
		add_child(label)
		x +=1

func _process(delta):
	purge()
	display()
	pass
