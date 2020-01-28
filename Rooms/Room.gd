extends Node2D

export (bool) var spawnRoom
var enemySpawnChance = 25
var powerupSpawnChance = 10
var enemy = preload("res://11thConcert/Enemy.tscn")
var power = preload("res://11thConcert/Powerups/1.tscn")

func _ready():
	if spawnRoom:
		$EnemySpawns.queue_free()
		$PowerSpawns.queue_free()
	else:
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var spawnsLeft = $EnemySpawns.get_child_count()
		while spawnsLeft > 0:
			if rng.randi_range(0, 100) <= enemySpawnChance:
				var e = enemy.instance()
				get_node("EnemySpawns/" + str(spawnsLeft)).add_child(e)
			spawnsLeft -= 1
		var powerSpawnsLeft = $PowerSpawns.get_child_count()
		while powerSpawnsLeft > 0:
			if rng.randi_range(0, 100) <= powerupSpawnChance:
				var p = power.instance()
				get_node("PowerSpawns/" + str(powerSpawnsLeft)).add_child(p)
			powerSpawnsLeft -= 1