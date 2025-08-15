extends Node2D

@onready var bola: Area2D = $"../bola"
@onready var pontuacao_jogador1_label: Label = $"../pontuacao_jogador1"
@onready var pontuacao_jogador2_label: Label = $"../pontuacao_jogador2"
var pontuacao_jogador1: int = 0
var pontuacao_jogador2: int = 0
func _ready() -> void:
	pass 



func _process(delta: float) -> void:
	pass


func _on_goleira_body_entered(body: Node2D) -> void:
	pass


func _on_goleira_2_body_entered(body: Node2D) -> void:
	pass


func _on_goleira_area_entered(area: Area2D) -> void:
	print("gol jogador 2")  
	bola.resetar_bola()
	$som_gol.play()
	pontuacao_jogador2 +=1
	pontuacao_jogador2_label.text = str(pontuacao_jogador2)
func _on_goleira_2_area_entered(area: Area2D) -> void:
	print("gol jogador 1")
	bola.resetar_bola()
	$som_gol.play()
	pontuacao_jogador1 +=1
	pontuacao_jogador1_label.text = str(pontuacao_jogador1)
