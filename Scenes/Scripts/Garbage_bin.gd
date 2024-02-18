extends CharacterBody2D

var screenSize

func _ready():
	screenSize = get_viewport_rect().size
	velocity = Vector2.ZERO # player's movement vector

func _physics_process(delta):
	pass

func move(v, speed, delta):
	# if we have a movement vector, move based on speed and play animation
	if v.length() > 0: 
		v = v.normalized() * speed
#	else:
#		animatedSprite.stop()				
	
	# update player position 
	position += v * delta# delta is frame length; movement remains consistent even if frame rate changes
	position.x = clamp(position.x, 32, screenSize.x - 32)
	position.y = clamp(position.y, 32, screenSize.y - 32)
	# position = position.clamp(Vector2.ZERO, screenSize) # clamp so that position does not leave screen

	move_and_slide()
