extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var current_index = -1
var dialogs = ["Dog: I'm cooked!"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if Input.is_action_just_pressed('action') and visible:
		current_index+=1
		if current_index >= dialogs.size():
			visible=false
			get_tree().call_group("controller","dialog",1)
			return
		$Panel/RichTextLabel.text = dialogs[current_index]
		
		
	pass
	
	
	
	
