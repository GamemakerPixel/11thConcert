extends Node

var colors = []
var playerPos = Vector2(0, 0)

func _ready():
	generateColors()

func generateColors():
	var colorsLeft = 5
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	while colorsLeft > 0:
		var r = rng.randf_range(0, 1)
		var g = rng.randf_range(0, 1)
		var b = rng.randf_range(0, 1)
		var color = Color(r, g, b)
		colors.append(color)
		colorsLeft -= 1