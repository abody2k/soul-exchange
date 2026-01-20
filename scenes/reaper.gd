extends CharacterBody3D


enum MODES{WANDERING,ATTACKING,ATTACKED}
var hp = 1000
var mode : MODES = MODES.WANDERING


func take_damge():
	hp -= 10
	pass


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var random_pos = Vector3.ZERO
var playable = false
@export var enemy : CharacterBody3D 

func start_the_game():
	playable = true
	$CanvasLayer/Control.visible = true

	
	
func _physics_process(delta):
	if  !playable:
		return

	match mode:
		MODES.WANDERING:
			if position.distance_to(random_pos) < 1:
				_on_timer_timeout()
			look_at(random_pos)
			velocity = -basis.z * 40
			move_and_slide()
			$AnimationPlayer.play("reaper_moving")

			
		MODES.ATTACKING:
			look_at(enemy.position)
			if position.distance_to(enemy.position) > 10:
				velocity = -basis.z * 60
				move_and_slide()
				
			else:
				mode = MODES.ATTACKED
				$BoneAttachment3D/Area3D.monitoring = true
				$AnimationPlayer.play("reaper_attack")
				


func _on_timer_timeout():
	if mode == MODES.ATTACKED or mode ==MODES.ATTACKING:
		return
		
	mode = randi_range(0,1) as MODES
	match mode:
		MODES.WANDERING:
			random_pos = Vector3(randf_range(-116.649,-15.009),randf_range(0,20),randf_range(-208.496,-108.682)) 
		MODES.ATTACKING:
			pass


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "reaper_attack":
		$BoneAttachment3D/Area3D.monitoring = false
		mode = MODES.WANDERING


func _on_area_3d_body_entered(body):
	enemy.take_damage(30)
	pass # Replace with function body.
