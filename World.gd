extends Node2D



func _ready():
	if GlobalVariables.colors.size() > 0:
		VisualServer.set_default_clear_color(GlobalVariables.colors[3])

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if GlobalVariables.colors.size() > 0:
			VisualServer.set_default_clear_color(GlobalVariables.colors[3])