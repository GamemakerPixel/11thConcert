extends Area2D

export (int) var damage
var Velocity = Vector2()

func start(Velocity_, rotation_, position_):
	$Sprite.modulate = GlobalVariables.colors[5]
	position = position_
	rotation = rotation_
	Velocity = Velocity_

func _physics_process(delta):
	position += Velocity

func _on_Lifetime_timeout():
	explode()

func explode():
	queue_free()

func _on_Bullet_body_entered(body):
	if body.name == "Player" || body.get_parent().name == "Walls":
		if body.has_method("take_damage"):
			body.take_damage(damage)
		explode()
		

