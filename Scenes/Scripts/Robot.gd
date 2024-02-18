extends CharacterBody2D


const SPEED = 300.0
var player

func _ready(): 
	$exclamationMark.visible = false
	player = get_parent().get_node("Player")
	

func _process(delta):
	if player.totalGarbageCounter > 10 and !player.backpackUpgraded:
		$exclamationMark.visible = true
	else:
		$exclamationMark.visible = false

func _physics_process(delta):
	pass
