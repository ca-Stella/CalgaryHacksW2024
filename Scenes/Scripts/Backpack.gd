extends TextureRect

var player
var garbageCount
var game
var backpackLevel

# Called when the node enters the scene tree for the first time.
func _ready():
	game = get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Game")
	print(game.name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player = game.get_node("Player")
	backpackLevel = player.backpackLevel
	var garbageCount = player.garbageCounter
	
	if garbageCount == 0:
		texture.set_current_frame(0)
	elif backpackLevel == 0:
		if garbageCount == 1:
			texture.set_current_frame(1)
		elif garbageCount == 2:
			texture.set_current_frame(2)
		elif garbageCount == 3:
			texture.set_current_frame(3)
	elif backpackLevel == 1:
		if garbageCount == 1:
			texture.set_current_frame(4)
		elif garbageCount == 2:
			texture.set_current_frame(5)
		elif garbageCount == 3:
			texture.set_current_frame(6)
		elif garbageCount == 4:
			texture.set_current_frame(7)
		elif garbageCount == 5:
			texture.set_current_frame(8)
		
	
