extends Area2D

export (int) var damage
var Velocity = Vector2()

func start(Velocity_, rotation_):
	position = get_parent().get_node("Player").position
	var direction = Vector2(1, 0).rotated(rotation_)
	rotation = rotation_
	Velocity = Velocity_

func _physics_process(delta):
	position += Velocity