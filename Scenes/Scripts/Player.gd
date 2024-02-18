extends CharacterBody2D

@export var speed = 100.0 # pixels/sec
var screenSize
var garbageCounter = 0
var totalGarbageCounter = 0 

var backpackLevel = 0
var faceDirection
var canPickUp = false
var garbage = null
var canPushBin = false
var bin = null
var pushingBin = false
var animatedSprite

# HERE
var nearWallE = false
var backpackUpgraded = false

func _ready(): 
	screenSize = get_viewport_rect().size
	animatedSprite = $AnimatedSprite2D

func _process(delta):
	if totalGarbageCounter == 34:
		get_parent().get_parent().game_win()
	var velocity = Vector2.ZERO # player's movement vector
	
	# HERE
	if Input.is_action_pressed("number_4"):
		get_tree().reload_current_scene()
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		faceDirection = "right"
		animatedSprite.play("RightWalk")
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1	
		faceDirection = "left"
		animatedSprite.play("LeftWalk")
	if Input.is_action_pressed("move_down"):
		velocity.y += 1	
		faceDirection = "down"
		animatedSprite.play("ForwardWalk")
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1	
		faceDirection = "up"
		animatedSprite.play("BackwardWalk")
	if Input.is_action_pressed("interact"): # HERE
		if canPickUp:
			garbage.get_parent().die()
			garbageCounter += 1
			# print(garbageCounter, faceDirection)
			canPickUp = false
		if canPushBin:
			get_parent().get_parent().mainHealth += (garbageCounter * 3)
			# HERE
			totalGarbageCounter += garbageCounter
#			get_parent().get_parent().mainHealth += garbageCounter * 5
			garbageCounter = 0
#			print("total: ", totalGarbageCounter)
		# HERE
		if nearWallE:
			if !backpackUpgraded:
				if totalGarbageCounter >= 9: 
					upgrade_bag()
					get_parent().get_node("Robot/exclamationMark").visible = false
				
			
	if Input.is_action_just_pressed("push_e"):
		print("pushed", canPushBin, pushingBin)
		if canPushBin and !pushingBin:
			pushingBin = true
		elif canPushBin and pushingBin:
			pushingBin = false
		if !canPushBin:
			pushingBin = false
#	if Input.is_action_just_released("push_e"):
#		pushingBin = false
#		print(canPushBin, pushingBin)
#	print(canPickUp)



	# if we have a movement vector, move based on speed and play animation
	if velocity.length() > 0: 
		if pushingBin and canPushBin:
			bin.get_parent().move(velocity, speed, delta)
		if garbageCounter != 0:
			if !backpackUpgraded:
				if garbageCounter == 1:
					velocity = velocity.normalized() * speed
				velocity = velocity.normalized() * speed / (garbageCounter * 0.6)
			else:
				if garbageCounter <= 2:
					velocity = velocity.normalized() * speed
				velocity = velocity.normalized() * speed / (garbageCounter * 0.4) # HERE
		else:
			velocity = velocity.normalized() * speed 
	else:
		velocity = Vector2.ZERO
#	else
#		animatedSprite.stop()				
	
	# update player position 
	position += velocity * delta# delta is frame length; movement remains consistent even if frame rate changes
	position.x = clamp(position.x, 32, screenSize.x - 32)
	position.y = clamp(position.y, 32, screenSize.y - 32)
	# position = position.clamp(Vector2.ZERO, screenSize) # clamp so that position does not leave screen

	move_and_slide()
		

func _physics_process(delta):
	pass
	
# HERE
func upgrade_bag():
	backpackLevel += 1
	backpackUpgraded = true

# HERE
func _on_area_2d_area_entered(area):
	if area.is_in_group("Trash"):
		if !backpackUpgraded and garbageCounter < 3:
			garbage = area
			canPickUp = true
		elif backpackUpgraded and garbageCounter < 5:
			garbage = area
			canPickUp = true
		else:
			garbage = null
			canPickUp = false
	if area.is_in_group("Bin"):
		bin = area
		canPushBin = true
	if area.is_in_group("walle"):
		nearWallE = true


func _on_area_2d_area_exited(area):
	if area.is_in_group("Trash"):
		garbage = null
		canPickUp = false
	if area.is_in_group("Bin"):
		bin = null
		canPushBin = false
	if area.is_in_group("walle"):
		nearWallE = false
