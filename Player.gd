extends KinematicBody2D

export (int) var speed

var motion = Vector2()
var canShoot = [true, true]
var buffed = [false, false, false]
var buffedTime = [0, 0, 0]
var damage = 1

func _ready():
	if GlobalVariables.colors.size() > 0:
		$Sprite.modulate = GlobalVariables.colors[0]

func buff(stat, value):
	$BuffTimer.start()
	if stat == "speed":
		if not buffed[0]:
			speed *= value
			buffed[0] = true
		buffedTime[0] += 5
	if stat == "damage":
		if not buffed[1]:
			damage *= value
			buffed[1] = true
		buffedTime[1] += 5
	if stat == "cooldown":
		if not buffed[2]:
			damage *= value
			buffed[2] = true
		buffedTime[2] += 5

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
	#DEBUG COMMANDS
	if Input.is_action_just_pressed("a"):
		$Camera2D.zoom = Vector2(1, 1)
	if Input.is_action_just_pressed("z"):
		$Camera2D.zoom = Vector2(2, 2)
	if Input.is_action_just_pressed("x"):
		$Camera2D.zoom = Vector2(5, 5)
	#/DEGUB COMMANDS
	GlobalVariables.playerPos = position
	$Sprite.look_at(get_global_mouse_position())
	if Input.is_action_pressed("mouse_left"):
		shoot(0)
	if Input.is_action_pressed("mouse_right"):
		shoot(1)
	if Input.is_action_just_pressed("ui_accept"):
		if GlobalVariables.colors.size() > 0:
			$Sprite.modulate = GlobalVariables.colors[0]

func shoot(type):
	var bullet = preload("res://11thConcert/PlayerBullet.tscn")
	var b = bullet.instance()
	if type == 0:
		if canShoot[0]:
			canShoot[0] = false
			$left_cooldown.start()
			var bulletRotation = $Sprite.rotation
			var bulletVelocity = Vector2(10, 0).rotated($Sprite.rotation)
			get_parent().add_child(b)
			b.start(bulletVelocity, bulletRotation, position)
	if type == 1:
		if canShoot[1]:
			canShoot[1] = false
			$right_cooldown.start()
			var bulletRotations = [deg2rad(0), deg2rad(45), deg2rad(90), deg2rad(135), deg2rad(180), deg2rad(225), deg2rad(270), deg2rad(315)]
			var bulletVelocities = []
			for rot in bulletRotations:
				bulletVelocities.append(Vector2(20, 0).rotated(rot))
			var bs = [bullet.instance(), bullet.instance(), bullet.instance(), bullet.instance(), bullet.instance(), bullet.instance(), bullet.instance(), bullet.instance()]
			for bullet_ in bs:
				get_parent().add_child(bullet_)
				bullet_.start(bulletVelocities[bs.find(bullet_)], bulletRotations[bs.find(bullet_)], position)
func _on_left_cooldown_timeout():
	canShoot[0] = true

func _on_right_cooldown_timeout():
	canShoot[1] = true

func take_damage(damage_):
	pass

func _on_BuffTimer_timeout():
	if buffedTime[0] > 0:
		buffedTime[0] -= 0.1
		$BuffTimer.start()
	else:
		if buffed[0]:
			speed /= 2
			buffed[0] = false
	if buffedTime[1] > 0:
		buffedTime[1] -= 0.1
		$BuffTimer.start()
	else:
		if buffed[1]:
			buffed[1] = false
	if buffedTime[2] > 0:
		buffedTime[2] -= 0.1
		$BuffTimer.start()
	else:
		if buffed[2]:
			$left_cooldown.wait_time = 0.8
			$right_cooldown.wait_time = 2
			buffed[2] = false
