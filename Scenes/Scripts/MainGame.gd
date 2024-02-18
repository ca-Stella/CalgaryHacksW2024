extends Control

var mainHealth = 100
var paused = false
var sec = 0
var min = 0
var Default_sec = 2
var Default_min = 0
var PauseScreen


# Called when the node enters the scene tree for the first time.
func _ready():
	mainHealth = 100
	ResetTimer()
	PauseScreen = $PauseScreen
	PauseScreen.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"Current Health".text = "HP: "+ str(mainHealth)	

	if Input.is_action_just_pressed("ui_cancel"):
		if paused:
			get_tree().paused = false
			PauseScreen.visible = false
			set_physics_process(true)
			paused = false
		else:
			PauseScreen.visible = true
			set_physics_process(false)
			get_tree().paused = true
			paused = true


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
