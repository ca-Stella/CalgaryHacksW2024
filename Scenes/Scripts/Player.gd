extends CharacterBody2D

@export var speed = 100.0 # pixels/sec
var screenSize
var garbageCounter = 0

func _ready(): 
	screenSize = get_viewport_rect().size
	pass

func _process(delta):
	var velocity = Vector2.ZERO # player's movement vector
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		# animatedSprite.flip_h = false
		# animatedSprite.play("sideways")
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1	
#		animatedSprite.flip_h = true
#		animatedSprite.play("sideways")
	if Input.is_action_pressed("move_down"):
		velocity.y += 1	
#		animatedSprite.play("forward")
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1	
#		animatedSprite.play("backward")
	if Input.is_action_pressed("interact"):
		speed *= .10

	# if we have a movement vector, move based on speed and play animation
	if velocity.length() > 0: 
		velocity = velocity.normalized() * speed
#	else:
#		animatedSprite.stop()
	
	# update player position 
	position += velocity * delta # delta is frame length; movement remains consistent even if frame rate changes
	position.x = clamp(position.x, 32, screenSize.x - 32)
	position.y = clamp(position.y, 32, screenSize.y - 32)
	# position = position.clamp(Vector2.ZERO, screenSize) # clamp so that position does not leave screen

	move_and_slide()
		

func _physics_process(delta):
	pass


func _on_area_2d_area_entered(area):
	if area.is_in_group("Trash"):
		garbageCounter += 1
		print(garbageCounter)
