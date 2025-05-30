extends Node2D
@export var level_start: Vector2 = Vector2(0, 0)
@onready var player: CharacterBody2D = $Player;
@onready var button: Button = $ResumeButton;
@onready var died_label: Label = $DiedLabel;
@onready var challice_label: Label = $ChalliceLabel;
@onready var youwin_label: Label = $YouWinLabel;

var paused: bool = true;
# Called when the node enters the scene tree for the first time.

func toggle_pause():
	for child in get_children():
		if child.has_method('pause'):
			child.pause();
	button.visible = paused;
		
func _ready():
	player.position = level_start;
	toggle_pause();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("pause"):
		paused = true;
		toggle_pause();

func _on_player_died(player_entity):
	player_entity.lives -= 1;
	if player_entity.lives < 1: queue_free();
	player_entity.position = level_start;
	died_label.visible = true;
	paused = true;
	toggle_pause();
	button.visible = false;
	await get_tree().create_timer(1.0).timeout
	died_label.visible = false;
	paused = false;
	toggle_pause();

func _on_button_pressed():
	paused = false;
	button.text = "Resume?"
	toggle_pause();



func _on_chalice_challice_picked_up():
	challice_label.visible = true;
	await get_tree().create_timer(5.0).timeout
	challice_label.visible = false;


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		paused = true;
		toggle_pause();
		youwin_label.visible = true;
		button.visible = false;
		await get_tree().create_timer(3.0).timeout
		get_tree().quit()
