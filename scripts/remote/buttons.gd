extends VBoxContainer

@export var list : Array[BaseButton]

signal button_pressed

func _ready():
	for button in list:
		#Sometimes I create an array bigger and forget to link an button so I check there
		if button == null:
			continue
		button.pressed.connect(_on_button_pressed.bind(button))
		

func _on_button_pressed(button):
	var index = list.find(button)
	emit_signal("button_pressed", button, index)
