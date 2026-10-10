extends Label
var time = 60;
signal end;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(time);
	if(time == 0):
		end.emit();
		hide();


func _on_time_timeout() -> void:
	time -= 1;
