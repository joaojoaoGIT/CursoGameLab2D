extends StaticBody2D

@export var jogador1: bool

func _ready() -> void:
	pass # Replace with function body.



func _process(delta: float) -> void:
	movimentar_jogador(delta)

func movimentar_jogador(delta: float) -> void:
	if jogador1:
		if Input.is_action_pressed("nv-cima1"):
			position.y -= 500 * delta
		elif Input.is_action_pressed("nv-baixo1"):
			position.y += 500 * delta
	else:
		if Input.is_action_pressed("nv-cima2"):
			position.y -= 500 * delta
		elif Input.is_action_pressed("nv-baixo2"):
			position.y += 500 * delta
