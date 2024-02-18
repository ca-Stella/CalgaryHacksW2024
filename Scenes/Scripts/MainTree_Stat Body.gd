extends StaticBody2D

@onready var animation = $MasterTreeV2
var health 

func _ready():
	pass


func _process(delta):
	health = get_parent().get_parent().mainHealth
	
	#health = randi_range(0,100)	
	
	if (health > 90):
		animation.play("Stage_1")
	elif (health > 76):
		animation.play("Stage_2")
	elif(health > 51):
		animation.play("Stage_3")
	elif(health > 0): 
		animation.play("Stage_4")
		
