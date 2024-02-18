extends Control

var mainHealth = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	mainHealth = 100
	ResetTimer()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"Current Health".text = "HP: "+ str(mainHealth)	
	pass

var sec = 0
var min = 0
var Default_sec = 2
var Default_min = 0

func _on_timer_timeout():
	if(sec == 0):
		if(min>0):
			min -=1
			sec = 60
		elif(min == 0):
			ResetTimer()
	sec -= 1
	$Label.text = str(min) + ":" + str(sec)	
	pass
		
func ResetTimer():
	#reduce total health 
	if(mainHealth == 0):
		mainHealth = 0
	elif(mainHealth > 0): mainHealth -=1
	
	sec = Default_sec
	min = Default_min
