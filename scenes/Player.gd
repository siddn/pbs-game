extends CharacterBody2D


const SPEED = 100.0 # Arbitrary, can be scaled
var direction: Vector2 = Vector2(0, 0);
var collided = false;
var inventory: Array = Array();
var lives: float = INF;
signal died(player_entity);
var paused: bool = false;

func handle_input():
	direction = Vector2(0,0)
	if Input.is_action_pressed('up'): direction.y += -1
	if Input.is_action_pressed('down'): direction.y += 1
	if Input.is_action_pressed('right'): direction.x += 1
	if Input.is_action_pressed('left'): direction.x += -1
	
	direction = direction.normalized();
	velocity = SPEED*direction;

func _ready():
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING;
	
func _process(delta):
	if paused: return;
	handle_input()
	collided = move_and_slide();

func take_item(item):
	inventory.append(item.item_name);
	print(inventory)

func pause():
	paused = !paused;

func die():
	died.emit(self)
