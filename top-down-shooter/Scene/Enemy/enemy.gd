extends CharacterBody2D
const SPEED = 100.0
@onready var player = $"../Player"

func _physics_process(delta: float) -> void:
	velocity = (player.global_position - global_position).normalized() * SPEED
	look_at(player.global_position)
	move_and_slide()
