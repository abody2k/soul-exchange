extends CharacterBody3D


enum MODES{WANDERING,ATTACKING}
var hp = 1000
var mode : MODES = MODES.WANDERING


func take_damge():
	hp -= 20
	pass


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var random_pos = Vector3.ZERO
var playable = false
@export var enemy : CharacterBody3D 

func start_the_game():
	playable = true

	
	
func _physics_process(delta):
	if  !playable:
		return
	print(mode)	
	match mode:
		MODES.WANDERING:
			look_at(random_pos)
			velocity = basis.x * 40
			move_and_slide()
			$AnimationPlayer.play("reaper_moving")
			print("looks")
			print(random_pos)
			
		MODES.ATTACKING:
			
			#look_at(enemy.position)
			pass


func _on_timer_timeout():
	mode = randi_range(0,1) as MODES
	match mode:
		MODES.WANDERING:
			random_pos = Vector3(randf_range(-116.649,-15.009),randf_range(0,20),randf_range(-208.496,-108.682)) 
		MODES.ATTACKING:
			pass
