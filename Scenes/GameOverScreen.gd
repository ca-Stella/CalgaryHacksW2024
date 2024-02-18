extends CanvasLayer

var paused

# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_restart_button_button_up():
	get_tree().paused = false
	get_tree().reload_current_scene()
	set_physics_process(true)


func _on_resume_button_button_up():
	get_tree().paused = false
	self.visible = false


func _on_quit_button_button_up():
	get_tree().quit()
