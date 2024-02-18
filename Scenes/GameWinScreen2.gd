extends CanvasLayer

var paused

# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_restart_button_button_up():
	get_tree().reload_current_scene()
	get_tree().paused = false



func _on_quit_button_button_up():
	pass # Replace with function body.
