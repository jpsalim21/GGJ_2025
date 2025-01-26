extends Area2D
class_name BolhaController

@export var estados : Array[BolhaBase]
@export var estadoAtual : BolhaBase

@onready var spriteEfeito : Sprite2D = $Sprite2D2
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@export var audioClip : AudioStream

var inFocus : bool = false:
	set(value):
		inFocus = value
		if inFocus:
			spriteEfeito.z_index = 4
			$Sprite2D.z_index = 4
		else:
			spriteEfeito.z_index = 1
			$Sprite2D.z_index = 1

var speed = 1.5  # Ajuste esse valor para controlar a velocidade do movimento
var amplitude = 70  # A altura do movimento (quanto sobe/ desce)
var time = 0.0  # Variável para controlar o tempo do movimento

func _ready() -> void:
	spriteEfeito.texture = estadoAtual.spriteIcon
	set_process(true)
	body_entered.connect(encostou)
	
func _process(delta):
	if estadoAtual.name == "Elevador":
		time += delta * speed
		var deslocamento_y = sin(time) * amplitude
		position.y = 120 + deslocamento_y

func mudarEstado():
	print(estadoAtual.name)
	var novoEstado : BolhaBase = estados.pop_front()
	estados.append(novoEstado)
	estadoAtual = novoEstado
	spriteEfeito.texture = novoEstado.spriteIcon

func encostou(body : Node2D):
	print(estadoAtual.name)
	var player = body as Player
	
	if not player:
		return
	
	audio_stream_player.stream = audioClip
	audio_stream_player.play()
	estadoAtual.encostou(player)
