extends Node2D

var rooms = Vector2(5, 5)
var roomScenes = [preload("res://11thConcert/Rooms/1.tscn")]
var roomPositions = PoolVector2Array()
const ROOM_SIZE = 832
var onRoom = Vector2(0, 0)

func _ready():
	placeRooms()
	if GlobalVariables.colors.size() > 0:
		VisualServer.set_default_clear_color(GlobalVariables.colors[3])

func placeRooms():
	var roomsToPlace = rooms.x * rooms.y
	while onRoom.x < rooms.x:
		roomPositions.append(Vector2(ROOM_SIZE * onRoom.x, ROOM_SIZE * onRoom.y))
		onRoom.x += 1
	onRoom.x = 0
	onRoom.y += 1
	for roomPos in roomPositions:
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var r = roomScenes[rng.randi_range(0, roomScenes.size() - 1)].instance()
		if roomPos == Vector2(0, 0):
			r = roomScenes[0].instance()
			$Rooms.add_child(r)
			r.spawnRoom = true
		else:
			$Rooms.add_child(r)
			r.position = roomPos
	if onRoom.y < rooms.y:
		placeRooms()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if GlobalVariables.colors.size() > 0:
			VisualServer.set_default_clear_color(GlobalVariables.colors[3])