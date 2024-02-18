extends TextureProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	self.value = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.value = ((get_parent().get_parent().get_parent().get_parent().get_parent().mainHealth))
	if self.value == 0:
		get_parent().get_parent().get_parent().get_parent().get_parent().game_over()
#	print("value = ", self.value)

func _on_value_changed(value):
	pass
	
