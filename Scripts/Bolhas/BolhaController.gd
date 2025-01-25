extends Area2D
class_name BolhaController

@export var estados : Array[BolhaBase]
@export var estadoAtual : BolhaBase

@onready var spriteEfeito : Sprite2D = $Sprite2D2

func _ready() -> void:
	spriteEfeito.texture = estadoAtual.spriteIcon
	body_entered.connect(encostou)

func mudarEstado():
	var novoEstado : BolhaBase = estados.pop_front()
	estados.append(novoEstado)
	estadoAtual = novoEstado
	spriteEfeito.texture = novoEstado.spriteIcon

func encostou(body : Node2D):
	var player = body as Player
	if not player:
		return
	
	estadoAtual.encostou(player)
