extends KinematicBody2D

var health = 3
var damage = 1
var speed
var readyToFire = false
var canShoot = false

func _ready():
	$Timer.start()
	$Sprite.modulate = GlobalVariables.colors[4]

func _process(delta):
	if readyToFire:
		if position.x - GlobalVariables.playerPos.x < 256
	look_at(GlobalVariables.playerPos)
	if readyToFire && canShoot:
		shoot()

func shoot():
	var bullet = preload("res://11thConcert/EnemyBullet.tscn")
	var rot = rotation
	var Vel = Vector2(10, 0).rotated(rotation)
	var b = bullet.instance()
	b.start(Vel, rot, position)
	get_parent().add_child(b)
	$Timer.start()
	canShoot = false

func take_damage(damage_):
	health -= damage
	if health <= 0:
		die()

func die():
	queue_free()

func _on_Range_body_entered(body):
	if body.name == "Player":
		readyToFire = true

func _on_Range_body_exited(body):
	if body.name == "Player":
		readyToFire = false

func _on_Timer_timeout():
	canShoot = true
