extends Node2D

var health
var damage
var speed

func _process(delta):
	$Sprite.look_at(GlobalVariables.playerPos)