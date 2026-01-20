extends CharacterBody3D


const SPEED = 20.0
const JUMP_VELOCITY = 4.5

var playable= false
var hp = 100


func take_damage(damage):
	hp -= damage
	
	if hp <= 0:
		hp = 0
		$CanvasLayer/Control/ProgressBar.value = hp
		get_tree().reload_current_scene()
		return
		
	$CanvasLayer/Control/ProgressBar.value = hp
	

func _ready():
	
	pass

func _physics_process(delta):
	if not playable:
		return
	# Add the gravity.
	#if not is_on_floor():
	velocity = get_gravity() 
	
	if Input.is_action_just_pressed("action"):
		print("HEYYYYYYYYYY")
		$AnimationPlayer.play("hero_attack")
		$BoneAttachment3D/Area3D.monitoring = true
		$BoneAttachment3D2/Area3D.monitoring = true
		$Timer.start()
		return

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_axis("forward","backward")
	var rot = Input.get_axis("rot_left","rot_right")
	
	
	
	$Armature_003.rotate_y(-delta * rot* 5)

	
	if input_dir and is_on_floor():
		$AnimationPlayer.play("hero_moving")
		velocity += $Armature_003.basis.x * -input_dir * SPEED
		
	elif not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("hero_idle")
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()



func start_the_game():
	playable = true
	$CanvasLayer/Control.visible = true
	$SpringArm3D/Camera3D.current = true
	pass

func _input(event):
	if not playable:
		return
		
	if event is InputEventMouseMotion:
		$SpringArm3D.rotate_y(0.07  * -clamp( (event as InputEventMouseMotion).relative.x,-1,1)) 
		$SpringArm3D/Camera3D.rotate_x(0.07  * -clamp( (event as InputEventMouseMotion).relative.y,-1,1)) 
		$SpringArm3D/Camera3D.rotation_degrees.x = clamp($SpringArm3D/Camera3D.rotation_degrees.x,-47,6.9)


func _on_area_3d_body_entered(body):
	body.take_damage()




func _on_animation_player_animation_finished(anim_name):
	if anim_name == "hero_attack":
		$BoneAttachment3D/Area3D.monitoring = false
		$BoneAttachment3D2/Area3D.monitoring = false
	pass # Replace with function body.
