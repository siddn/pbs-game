extends CharacterBody2D

@export var horizontal:bool = true;
@export var invert_start:bool = true;

@export var SPEED = 50.0

var direction: Vector2 = Vector2(0, 0);
var collided: bool = false;
var paused: bool = false;

func _ready():
	if horizontal:
		direction = Vector2(1, 0);
	else:
		direction = Vector2(0, 1);
	if invert_start:
		direction *= -1;

func _process(delta):
	if paused: return;
	velocity = direction * SPEED;
	collided = move_and_slide();
	if collided:
		direction *= -1;
			
func pause():
	paused = !paused;

func _on_area_2d_body_entered(body):
	print(body)
	if body.name == "Player":
		body.die()
