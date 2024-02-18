extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_restart_button_button_up():
	pass # Replace with function body. UHOH




func _on_resume_button_button_up():
	get_tree().paused = false
	self.visible = false


func _on_quit_button_button_up():
	pass # Replace with function body.
