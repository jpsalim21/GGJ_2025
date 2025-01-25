extends Area2D
class_name BolhaBase

@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	body_entered.connect(encostou)

func destruir():
	audio.play()
	visible = false
	await audio.finished
	queue_free()

func encostou(body: Node2D) -> void:
	pass
