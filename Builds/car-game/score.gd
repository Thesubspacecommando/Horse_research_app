extends Label
var score = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_restaraunt_collect() -> void:
	score += 1;
	text = str(score);


func _on_timer_l_end() -> void:
	position = Vector2(350, 300);
	text = "Game Over! Your score is: " + str(score);
