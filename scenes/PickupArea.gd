extends Area2D
signal picked_up;
const item_name = "CHALICE";

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.has_method('take_item'):
		body.take_item(self);
	picked_up.emit()
