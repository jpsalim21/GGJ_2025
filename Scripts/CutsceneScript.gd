extends AnimationPlayer


func _ready() -> void:
	animation_finished.connect(terminouAnimacao)

func terminouAnimacao(animName : String) -> void:
	SceneController.changeSceneTo("res://Fase1_1.tscn")
