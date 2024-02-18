extends Control

var mainHealth = 1
var paused = false
#var sec = 0
#var min = 0
#var Default_sec = 2
#var Default_min = 0
var PauseScreen
var totalNumberGarbage = 34
var timerLabel
var actualTimer
var loseProgress
var gameOverScreen
var gameWinScreen


# Music from: https://www.chosic.com/download-audio/58136/

# Called when the node enters the scene tree for the first time.
func _ready():
	mainHealth = 1
	PauseScreen = $PauseScreen
	gameOverScreen = $GameOverScreen
	gameWinScreen = $GameWinScreen2
	$Timer.start()
	PauseScreen.visible = false
	gameOverScreen.visible = false
	gameWinScreen.visible = false
	actualTimer = get_node("Timer")
	timerLabel = get_node("StatusBar/CanvasLayer/MarginContainer/HBoxContainer/Timer/TimerLabel")
	loseProgress = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if paused:
			paused = false
			get_tree().paused = false
			PauseScreen.visible = false
			gameOverScreen.visible = false
			gameWinScreen.visible=false
			set_physics_process(true)

		else:
			paused = true
			PauseScreen.visible = true
			gameOverScreen.visible = false
			gameWinScreen.visible=false
			set_physics_process(false)
			get_tree().paused = true

	if loseProgress:
		if mainHealth > 0:
			mainHealth -= 1 * 0.05
	if mainHealth == 0:
		game_over()
	elif mainHealth >= 100:
		game_win()
	if mainHealth != 0:
		if floor(actualTimer.time_left / 60) <= 0:
			timerLabel.get_parent().get_node("TimerTexture").texture.pause = false
		timerLabel.text = "%d:%02d" % [floor(actualTimer.time_left / 60), int(actualTimer.time_left) % 60]

func game_over():
	gameOverScreen.visible = true
	gameWinScreen.visible = false
	PauseScreen.visible = false
	set_physics_process(false)
	get_tree().paused = true
	PauseScreen.queue_free()
	
func game_win():
	paused = true
	PauseScreen.visible = false
	gameOverScreen.visible = false
	gameWinScreen.visible= true
	set_physics_process(false)
	get_tree().paused = true
	

func _on_timer_timeout():
	loseProgress = true
#	if(sec == 0):
#		if(min>0):
#			min -=1
#			sec = 60
#		elif(min == 0):
#			ResetTimer()
#	sec -= 1
#	$Label.text = str(min) + ":" + str(sec)	
#	pass
		
#func ResetTimer():
#	#reduce total health 
#	if(mainHealth == 0):
#		mainHealth = 0
#	elif(mainHealth > 0): mainHealth -=1
#
#	sec = Default_sec
#	min = Default_min
