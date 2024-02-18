extends CharacterBody2D

@export var speed = 100.0 # pixels/sec
var screenSize
var garbageCounter = 0
var faceDirection
var canPickUp = false
var garbage = null

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
			print(garbageCounter, faceDirection)
			canPickUp = false

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


func _on_area_2d_area_exited(area):
	if area.is_in_group("Trash"):
		garbage = null
		canPickUp = false
		
		


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

