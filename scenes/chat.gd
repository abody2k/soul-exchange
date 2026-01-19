extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var current_index = -1
var dialogs = ["Dog: I'm cooked!"]
var final_dialog = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if Input.is_action_just_pressed('action') and visible:
		current_index+=1
		if current_index >= dialogs.size():
			visible=false
			if not final_dialog:
				get_tree().call_group("controller","dialog",1)
			else:
				get_tree().call_group("controller","dialog",2)
			current_index = -1

			final_dialog = true                   
			dialogs = ["YOU : OH WOW! My dog almost got hit, wow, what do you think you are doing grimreaper?",
"GRIM REAPER : I'm doing my job, homie.
", "YOU : And what job would that be?",
"GRIM REAPER: The job of hunting souls and sending them back to the source, you see, you and your are already dead",
"YOU : I'm not letting you get away with it, as a matter of fact I'm using all I have in hand to protect my dogg",
"GRIM REAPER: Which hand are you talking about?",
"YOU : ...",
"GRIM REAPER: HEHE...",
"GRIMP REAPER: How about we make a deal? you trade your soul in exchange I will let your dog live",
"YOU : NOT A CHANCE",
"DOG: AYO guys, it feels hot in here, can we take the discussion somewhere else?",
"YOU : Wait! you can talk?",
"DOG : ofc I can, it's just that we only talk to dead ppl and judging by the way you look you are already cooked"

]

			return
		$Panel/RichTextLabel.text = dialogs[current_index]
		
		
	pass
	
	
	
	
