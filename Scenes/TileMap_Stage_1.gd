extends TileMap

var health
var tile_map : TileMap = self

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	health = get_parent().get_parent().mainHealth
	
	if(health > 20 && health < 40):
		tile_map.show()
	
	pass
