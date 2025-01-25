extends Node

@onready var player: Player = $"../Player"

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("Cima") and Input.is_action_pressed("Espaco"):
		get_tree().paused = true
		SceneController.setPositionFocus(player.global_position)
		SceneController.reloadCurrentScene("CircleToon")
