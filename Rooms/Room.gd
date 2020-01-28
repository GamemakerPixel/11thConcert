extends Node2D

export (bool) var spawnRoom
var enemySpawnChance = 50
var powerupSpawnChance = 25
var enemy = preload("res://11thConcert/Enemy.tscn")

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
				add_child(e)
				e.position = get_node("EnemySpawns").get_node(str(spawnsLeft)).position
			spawnsLeft -= 1