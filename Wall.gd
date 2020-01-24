extends StaticBody2D



func _ready():
	if GlobalVariables.colors.size() > 0:
		$Sprite.modulate = GlobalVariables.colors[2]

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if GlobalVariables.colors.size() > 0:
			$Sprite.modulate = GlobalVariables.colors[2]