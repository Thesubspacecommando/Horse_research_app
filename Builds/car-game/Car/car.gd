extends CharacterBody2D
var ROTATIONAL_CONST = .06; #turning radius
var accel = 0; #makes the car accelerate
var can_rotate = false;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_dir = Input.get_axis("forward", "reverse")
	if(input_dir):
		velocity = transform.x * input_dir * (accel * 1000);
	else:
		velocity = lerp(velocity, Vector2.ZERO, .025)
	if(Input.is_action_pressed("rotate_left") && can_rotate):
		rotation -= ROTATIONAL_CONST;
	if(Input.is_action_pressed("rotate_right") && can_rotate):
		rotation += ROTATIONAL_CONST;
	if(!Input.is_action_pressed("reverse") || !Input.is_action_pressed("forward")):
		can_rotate = false;
		if(accel >0):
			accel -= .01;
	if(Input.is_action_pressed("forward")):
		can_rotate = true;
		if(accel < 1):
			accel += .025;
	if(Input.is_action_pressed("brake")):
		if(accel > 0):
			accel -= .05;
	if(Input.is_action_pressed("reverse")):
		can_rotate = true;
		if(accel < 1):
			accel += .025;
	move_and_slide();


func _on_timer_l_end() -> void:
	hide();
