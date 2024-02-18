extends CanvasLayer

var paused

# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	paused = get_parent().paused


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if paused:
			get_tree().paused = false
			self.visible = false
			set_physics_process(true)
			paused = false
		else:
			self.visible = true
			set_physics_process(false)
			get_tree().paused = true
			paused = true


func _on_restart_button_button_up():
	get_tree().reload_current_scene()
	set_physics_process(true)
	get_tree().paused = false


func _on_resume_button_button_up():
	get_tree().paused = false
	self.visible = false


func _on_quit_button_button_up():
	get_tree().quit()
