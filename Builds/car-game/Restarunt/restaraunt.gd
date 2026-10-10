extends Area2D
var active = false;
var transparency = 1;
var trans_switch = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (active == false):
		$"Green Circle".hide();
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	active = true;
	if(active == true):
		$"Green Circle".show();
		if(trans_switch == false):
			if(transparency <= .25):
				trans_switch = true;
			else:
				transparency -= .05;
				$"Green Circle".set_modulate(Color(1,1,1,transparency));
		elif(trans_switch == true):
			if(transparency >= 1.5):
				trans_switch = false;
			else:
				transparency += .05;
				$"Green Circle".set_modulate(Color(1,1,1,transparency));
	pass
