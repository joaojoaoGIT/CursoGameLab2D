extends StaticBody2D

@export var jogador1 : bool
var velocidade_jogador: int = 500
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movimentar_jogador(delta)
	limitar_movimento_jogador()
func movimentar_jogador(delta: float) -> void:
	if jogador1:
		if Input.is_action_pressed("mv-cima1"):
			position.y -= velocidade_jogador * delta
		elif Input.is_action_pressed("mv-baixo1"):
			position.y += velocidade_jogador * delta
	else:
		if Input.is_action_pressed("mv-cima2"):
			position.y -= velocidade_jogador * delta
		elif Input.is_action_pressed("mv-baixo2"):
				position.y += velocidade_jogador * delta

func limitar_movimento_jogador() -> void:
	position.y = clamp(position.y, 64, 654)
