extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
var rolling
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("mv-left", "mv-right")
	if direction:
		if direction > 0:
			animated_sprite_2d.flip_h = false
		else:
			animated_sprite_2d.flip_h = true
		if(not rolling):
			animated_sprite_2d.play("run")
		if Input.is_action_just_pressed("roll"):
			rolling = true
			animated_sprite_2d.play("roll")
		velocity.x = direction * SPEED
	else:
		animated_sprite_2d.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	rolling = false
