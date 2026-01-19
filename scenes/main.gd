extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_key_pressed(KEY_ESCAPE):
		$CanvasLayer/Control2.visible = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	pass


func _on_button_button_down():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$CanvasLayer/Control.visible= false


func _on_button_2_button_down():
	get_tree().quit(0)
	pass # Replace with function body.


func _on_resume_button_down():
	$CanvasLayer/Control2.visible = false
	pass # Replace with function body.
