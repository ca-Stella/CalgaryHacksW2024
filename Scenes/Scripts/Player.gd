extends CharacterBody2D

@export var speed = 100.0 # pixels/sec
var screenSize
var garbageCounter = 0
var totalGarbageCounter = 0 # NEED TO MOVE THIS TO TREE OR STH
# so that the bins can be the way of updating not player


################
## Move to main_game.gd 
#
## in var
#var paused = false
#
## in process
#if Input.is_action_pressed("ui_cancel"):
#	get_tree().paused = true
#	set_physics_process(false)
#	paused = true


###################

var faceDirection
var canPickUp = false
var garbage = null
var canPushBin = false
var bin = null
var pushingBin = false

func _ready(): 
	screenSize = get_viewport_rect().size
	pass

func _process(delta):
	var velocity = Vector2.ZERO # player's movement vector
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		faceDirection = "right"
		# animatedSprite.flip_h = false
		# animatedSprite.play("sideways")
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1	
		faceDirection = "left"
#		animatedSprite.flip_h = true
#		animatedSprite.play("sideways")
	if Input.is_action_pressed("move_down"):
		velocity.y += 1	
		faceDirection = "down"
#		animatedSprite.play("forward")
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1	
		faceDirection = "up"
#		animatedSprite.play("backward")
	if Input.is_action_pressed("interact"):
		if canPickUp:
			garbage.get_parent().die()
			garbageCounter += 1
			totalGarbageCounter += 1
			print(garbageCounter, faceDirection)
			canPickUp = false
		if canPushBin:
			garbageCounter = 0
	if Input.is_action_just_pressed("push_e"):
		if canPushBin and !pushingBin:
			pushingBin = true
		elif canPushBin and pushingBin:
			pushingBin = false
		if !canPushBin:
			pushingBin = false
		print(canPushBin, pushingBin)
				
	
	print(canPickUp)

	if pushingBin and canPushBin:
		bin.get_parent().move(velocity, speed, delta)

	# if we have a movement vector, move based on speed and play animation
	if velocity.length() > 0: 
		velocity = velocity.normalized() * speed
#	else:
#		animatedSprite.stop()				
	
	# update player position 
	position += velocity * delta# delta is frame length; movement remains consistent even if frame rate changes
	position.x = clamp(position.x, 32, screenSize.x - 32)
	position.y = clamp(position.y, 32, screenSize.y - 32)
	# position = position.clamp(Vector2.ZERO, screenSize) # clamp so that position does not leave screen

	move_and_slide()
		

func _physics_process(delta):
	pass


func _on_area_2d_area_entered(area):
	if area.is_in_group("Trash"):
		garbage = area
		canPickUp = true
	if area.is_in_group("Bin"):
		bin = area
		canPushBin = true


func _on_area_2d_area_exited(area):
	if area.is_in_group("Trash"):
		garbage = null
		canPickUp = false
	if area.is_in_group("Bin"):
		bin = null
		canPushBin = false
		
		


#func _on_top_area_2d_area_entered(area):
#	if faceDirection == "top":
#		if area.is_in_group("Trash"):
#			if Input.is_action_pressed("interact"):
#				area.queue_free()
#				garbageCounter += 1
#				print(garbageCounter, faceDirection)
#
#
#func _on_down_area_2d_area_entered(area):
#	if faceDirection == "down":
#		if area.is_in_group("Trash"):
#			if Input.is_action_pressed("interact"):
#				area.queue_free()
#				garbageCounter += 1
#				print(garbageCounter, faceDirection)
#
#func _on_left_area_2d_area_entered(area):
#	if faceDirection == "left":
#		if area.is_in_group("Trash"):
#			if Input.is_action_pressed("interact"):
#				area.queue_free()
#				garbageCounter += 1
#				print(garbageCounter, faceDirection)
#
#func _on_right_area_2d_area_entered(area):
#	if faceDirection == "right":
#		if canPickUp:
#			area.queue_free()
#			garbageCounter += 1
#			print(garbageCounter, faceDirection)
#
#

