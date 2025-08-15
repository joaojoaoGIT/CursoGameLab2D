extends Area2D
var velocidade_da_bola: int = 500
var posicao_inicial: Vector2 = Vector2(640, 360)
var direcao_inicial: Vector2 = Vector2(0, 0)
var nova_direcao: Vector2 = Vector2(0, 0)

var y_minimo: int = 0
var y_maximo: int = 720

func _ready() -> void:
	resetar_bola()

func _process(delta: float) -> void:
	movimentar_bola(delta)
	colidir_com_paredes()
func resetar_bola() -> void:
	position = posicao_inicial
	escolher_direcao_inicial()
	
func escolher_direcao_inicial() -> void:
	var x_aleatorio = [1, -1].pick_random()
	var y_aleatorio = [1, -1].pick_random()
	direcao_inicial = Vector2(x_aleatorio, y_aleatorio)
	nova_direcao = direcao_inicial

func movimentar_bola(delta: float) -> void:
	position += nova_direcao * velocidade_da_bola * delta

func colidir_com_paredes() -> void:
	if(position.y >= y_maximo or position.y <= y_minimo):
		if(position.x >= 0 and position.x <= 1280):
			nova_direcao.y *= -1
			$som_colisao_parede.play()

func _on_body_entered(body: Node2D) -> void:
		nova_direcao.x *= -1
		$"som-colisao-jogador".play()
