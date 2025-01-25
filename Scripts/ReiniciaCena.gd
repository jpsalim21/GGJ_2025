extends Node

func reiniciaFase(event: InputEvent) -> void:
	if Input.is_action_pressed("Cima") and Input.is_action_pressed("Espaco"):
		SceneController.reloadCurrentScene()
