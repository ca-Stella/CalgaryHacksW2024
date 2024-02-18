extends TextEdit

var healthofgame 
var curr_Time
# Called when the node enters the scene tree for the first time.
func _ready():
	healthofgame = get_parent().get_parent().get_parent().get_parent().get_parent().mainHealth
	text = str(healthofgame)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	healthofgame = 70
	print(healthofgame)
	text = str(healthofgame)
	
	
