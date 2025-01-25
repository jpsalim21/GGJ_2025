extends Area2D

@export var nextScene : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(finalizar)

func finalizar(body : Node2D):
	SceneController.changeSceneTo(nextScene)
