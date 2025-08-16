extends Node2D

var game_running : bool
var game_over : bool

@export var pipes_scene : PackedScene
var pipes : Array
const PIPE_DELAY = 100
const PIPE_RANGE = 150

const SCROLL_SPEED : int = 4
var screen_size : Vector2
var ground_height : int
var scroll : int 
@onready var ground: Area2D = $ground
@onready var bird: CharacterBody2D = $Bird
@onready var timer: Timer = $Timer
@onready var score_label: Label = $score

var score = 0

func _ready() -> void:
	screen_size = get_window().size
	ground_height = 168
	new_game()

func new_game():
	game_running = false
	game_over = false
	timer.start()
	
func _process(delta: float) -> void:
	check_game_state()
	if game_running:
		score_label.text = "Pontos : " + str(score)
		scroll += SCROLL_SPEED
		if scroll >= screen_size.x:
			scroll = 0
		ground.position.x = -scroll
	for pipe in pipes:
		pipe.position.x -= SCROLL_SPEED 

func check_game_state():
	if game_over == false:
		if Input.is_action_just_pressed("flap"):
			if (game_running == false):
				start_game()
	
func start_game():
	game_running = true
	bird.flying = true
	bird.flap()


func _on_timer_timeout() -> void:
	generate_pipes()
	
func generate_pipes():
	var pipes_i = pipes_scene.instantiate()
	pipes_i.position.x = screen_size.x + PIPE_DELAY
	pipes_i.position.y = (screen_size.y - ground_height) / 2 + randi_range(-PIPE_RANGE, PIPE_RANGE)
	pipes_i.hit.connect(bird_hit)
	pipes_i.score.connect(count_score)
	add_child(pipes_i)
	pipes.append(pipes_i)

func count_score():
	score += 1

func bird_hit():
	stop_game()
	bird.falling = true
	
func stop_game():
	timer.stop()
	game_over = true
	game_running = false
	bird.flying = false


func _on_ground_hit() -> void:
	stop_game()
	bird.falling = false
