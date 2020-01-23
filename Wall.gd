extends StaticBody2D



func _ready():
	if GlobalVariables.colors.size() > 0:
		$Sprite.modulate = GlobalVariables.colors[2]