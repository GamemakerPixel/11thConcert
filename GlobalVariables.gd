extends Node

var colors = []
var playerPos = Vector2(0, 0)

func _ready():
	generateColors()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		colors.clear()
		generateColors()

func generateColors():
	var colorsLeft = 6
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	while colorsLeft > 0:
		var r = rng.randf_range(0, 0.7)
		var g = rng.randf_range(0, 0.7)
		var b = rng.randf_range(0, 0.7)
		var color = Color(r, g, b)
		colors.append(color)
		colorsLeft -= 1