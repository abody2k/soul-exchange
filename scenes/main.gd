extends Node3D


func _ready():
	print(Vector3(-71.1, 5.36, -153.3).distance_to(Vector3(-55.17,5.354, -154.6)))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_key_pressed(KEY_ESCAPE):
		$CanvasLayer/Control2.visible = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	pass


func _on_button_button_down():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$CanvasLayer/Control.visible= false
	$AnimationPlayer.play("start")
	$Camera3D.current = true


func _on_button_2_button_down():
	get_tree().quit(0)
	pass # Replace with function body.


func _on_resume_button_down():
	$CanvasLayer/Control2.visible = false
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name):
	
	match anim_name:
		"start":
			$CanvasLayer/CHAT.visible=true
		"second":
			$CharacterBody3D2/AnimationPlayer.stop()
			$AnimationPlayer.play("third")
			$CharacterBody3D/AnimationPlayer.play("hero_blocking")
			$CharacterBody3D2/AnimationPlayer.play("reaper_blocking")
		"third":
			$CanvasLayer/CHAT.visible=true
	pass 




func dialog(number):
	match number:
		1:
			$AnimationPlayer.play("second")
			$CharacterBody3D2/AnimationPlayer.play("reaper_attack")
		2:
			get_tree().call_group("player","start_the_game")
	pass
