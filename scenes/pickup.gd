extends StaticBody2D

signal challice_picked_up;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pickup_area_picked_up():
	challice_picked_up.emit()
	queue_free()
