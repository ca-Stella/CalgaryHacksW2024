extends StaticBody2D

@onready var animation = $Big_Rock_Type_2
var health 

func _ready():
	animation = $Big_Rock_Type_2
	pass


func _process(delta):
	health = get_parent().get_parent().mainHealth
	
	#MAIN ROCK 2
	
	if (health > 0 && health < 30):
		animation.play("Stage_1")
	elif (health > 35 && health < 75):
		animation.play("Stage_2")
	elif(health > 75):
		animation.play("Stage_3")

		
