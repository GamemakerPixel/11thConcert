extends KinematicBody2D

export (int) var speed

var motion = Vector2()
var canShoot = [true, true]

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
	else:
		motion.x = 0
	if Input.is_action_pressed("ui_down"):
		motion.y = speed
	elif Input.is_action_pressed("ui_up"):
		motion.y = -speed
	else:
		motion.y = 0
	move_and_slide(motion)

func _process(delta):
	$Sprite.look_at(get_global_mouse_position())
	if Input.is_action_pressed("mouse_left"):
		shoot(0)
	if Input.is_action_pressed("mouse_right"):
		shoot(1)

func shoot(type):
	var bullet = preload("res://11thConcert/PlayerBullet.tscn")
	var b = bullet.instance()
	if type == 0:
		var bulletRotation = $Sprite.rotation
		var bulletVelocity = Vector2(10, 0).rotated($Sprite.rotation)
		get_parent().add_child(b)
		b.start(bulletVelocity, bulletRotation)