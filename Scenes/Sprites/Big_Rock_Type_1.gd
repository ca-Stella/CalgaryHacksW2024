extends StaticBody2D

@onready var animation = $Big_Rock_Type_1
var health 

func _ready():
	animation = $Big_Rock_Type_1
	pass


func _process(delta):
	health = get_parent().get_parent().mainHealth
	
	#MAIN ROCK
	
	if (health > 90):
		animation.play("Stage_1")
	elif (health > 76):
		animation.play("Stage_2")
	elif(health > 51):
		animation.play("Stage_3")
	elif(health > 0): 
		animation.play("Stage_3")
		
