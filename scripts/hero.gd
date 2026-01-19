extends CharacterBody3D


const SPEED = 20.0
const JUMP_VELOCITY = 4.5


func _ready():
	
	pass

func _physics_process(delta):
	
	# Add the gravity.
	#if not is_on_floor():
	velocity = get_gravity() 

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_axis("forward","backward")
	var rot = Input.get_axis("rot_left","rot_right")
	$Armature_003.rotate_y(-delta * rot* 5)

	
	if input_dir and is_on_floor():
		$AnimationPlayer.play("hero_moving")
		velocity += $Armature_003.basis.z * -input_dir * SPEED
		
	else:
		$AnimationPlayer.play("hero_idle")
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()



func _input(event):
	if event is InputEventMouseMotion:
		$SpringArm3D.rotate_y(0.07  * -clamp( (event as InputEventMouseMotion).relative.x,-1,1)) 
		$SpringArm3D/Camera3D.rotate_x(0.07  * -clamp( (event as InputEventMouseMotion).relative.y,-1,1)) 
		$SpringArm3D/Camera3D.rotation_degrees.x = clamp($SpringArm3D/Camera3D.rotation_degrees.x,-47,6.9)


func _on_button_button_down():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pass # Replace with function body.


func _on_button_2_button_down():
	get_tree().quit(0)
	pass # Replace with function body.
