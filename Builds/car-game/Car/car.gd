extends Area2D
var directionX = 0; #this tells us how the car is oriented
var directionY = 90;
var rotatedX = false; 
var rotatedY = false;
var ROTATIONAL_CONST = .06; #turning radius
var accel = 0; #makes the car accelerate
var reversed = false; #tells us if the car is supposed to go in reverse
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(directionX);
	if(directionX > 70): ##snaps to the 4 primary directions when it's close enough, excluding when the player is currently turning
		if !(Input.is_action_pressed("rotate_left") || (Input.is_action_pressed("rotate_right"))):
			$AnimatedSprite2D.rotation = PI/2;
			directionX = 90;
			directionY = 0;
	if(directionX < -70):
		if !(Input.is_action_pressed("rotate_left") || (Input.is_action_pressed("rotate_right"))):
			$AnimatedSprite2D.rotation = -PI/2;
			directionX = -90;
			directionY = 0;
	if(directionY > 70):
		if !(Input.is_action_pressed("rotate_left") || (Input.is_action_pressed("rotate_right"))):
			$AnimatedSprite2D.rotation = 0;
			directionX = 0;
			directionY = 90;
	if(directionY < -70):
		if !(Input.is_action_pressed("rotate_left") || (Input.is_action_pressed("rotate_right"))):
			$AnimatedSprite2D.rotation = PI;
			directionX = 0;
			directionY = -90;
	if(Input.is_action_just_pressed("Reverse")):
		reversed = !reversed;
		print(reversed);
	if(Input.is_action_pressed("Brake")):
		if(accel > 0.0):
			accel -= .1;
			#$Camera2D.position.x -= 1;
		if(accel < 0.0):
			accel = 0;
			#$Camera2D.position.x = 0;
	if !(Input.is_action_pressed("forward")): #simulates inertia
		if(accel > .3):
			accel -= .01;
			#$Camera2D.position.x -= .1;
	if Input.is_action_pressed("rotate_left"):
		if(accel > 0):
			turnLeft();
	if Input.is_action_pressed("rotate_right"):
		if(accel > 0):
			turnRight();
	if Input.is_action_pressed("forward"):
		if(accel < 2):
			accel += .1;
			#$Camera2D.position.x += 1;
	if (directionY > 70 || directionY < -70):
		if !(Input.is_action_pressed("rotate_left") || (Input.is_action_pressed("rotate_right"))):
			position.x += 0;
	elif(!reversed):
			position.x += accel * directionX/10;
	else:
		position.x -= accel * directionX/10;
	if (directionX > 70 || directionX < -70):
		if !(Input.is_action_pressed("rotate_left") || (Input.is_action_pressed("rotate_right"))):
			position.y -= 0;
	elif(!reversed):
		position.y -= accel * directionY/10;
	else:
		position.y += accel * directionY/10;
		
	
	pass

func turnLeft(): #updates the X & Y directional values, then cosmetically rotates the car counter clockwise
	if(directionX <= -90): #when directionX hits -90 degrees, the rotation starts increasing
		rotatedX = true;
	elif(directionX >= 90): #when directionX hits 90 degrees, the rotation starts decreasing
		rotatedX = false;
	if(directionY >= 90): #Same for directionY
		rotatedY = true;
	elif(directionY <= -90):
		rotatedY = false;
	if(rotatedX): 
		directionX += ROTATIONAL_CONST * 180/PI;
	else:
		directionX -= ROTATIONAL_CONST * 180/PI;
	if(rotatedY):
		directionY -= ROTATIONAL_CONST * 180/PI;
	else:
		directionY += ROTATIONAL_CONST * 180/PI;
	$AnimatedSprite2D.rotation -= ROTATIONAL_CONST;
func turnRight(): #Read left, but opposite
	if(directionX >= 90):
		rotatedX = true;
	elif(directionX <= -90):
		rotatedX = false;
	if(directionY <= -90):
		rotatedY = true;
	elif(directionY >= 90):
		rotatedY = false;
	if(rotatedX):
		directionX -= ROTATIONAL_CONST * 180/PI;
	else:
		directionX += ROTATIONAL_CONST * 180/PI;
	if(rotatedY):
		directionY += ROTATIONAL_CONST * 180/PI;
	else:
		directionY -= ROTATIONAL_CONST * 180/PI;
	$AnimatedSprite2D.rotation += ROTATIONAL_CONST;


func _on_restaraunt_area_entered(area: Area2D) -> void:
	pass;
