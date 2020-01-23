extends Node2D

var spawnRoom

func _ready():
	if spawnRoom:
		$EnemySpawns.queue_free()
		$PowerSpawns.queue_free()
	else:
		pass