extends CharacterBody2D

const GRAVITY: int = 1000
const MAX_VEL: int = 600
const FLAP_SPEED: int = -500

var flying: bool = false
var falling: bool = false

const START_POS = Vector2(100, 400)

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	reset()

func reset():
	flying = false
	falling = false
	position = START_POS
	
func _physics_process(delta: float) -> void:
	if flying or falling:
		velocity.y += GRAVITY * delta 
		
		if velocity.y >= MAX_VEL:
			velocity.y = MAX_VEL
		
		
		if flying:
			set_rotation(deg_to_rad(velocity.y * 0.05))
			animated_sprite_2d.play()
			flap()
		elif falling:
			set_rotation(PI / 2)
			animated_sprite_2d.stop( )
		move_and_slide()

func flap():
	if Input.is_action_just_pressed('flap'):
		velocity.y = FLAP_SPEED
