extends RigidBody2D
class_name Player

var torque : float = 5000 #Testei esse valor aq e deu certo. Podemos alterar depois, mas aqui ele consegue subir 30 graus sem problemas
var direcao : float

var bolhaProx : BolhaController
@onready var area: Area2D = $Area2D

@export var colorRect : ColorRect

func _process(delta: float) -> void:
	direcao = Input.get_axis("Esquerda", "Direita")
	
	if Input.is_action_pressed("Espaco") and bolhaProx:
		if Input.is_action_just_pressed("Direita") or Input.is_action_just_pressed("Esquerda"):
			bolhaProx.mudarEstado()
	if Input.is_action_just_released("Espaco"):
		Engine.time_scale = 1
		if bolhaProx:
			bolhaProx.inFocus = false
		colorRect.visible = false

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	state.apply_torque(direcao * torque)

func _on_area_2d_area_exited(area: Area2D) -> void:
	var bolha = area as BolhaController
	if not bolha:
		return

func getProxBolha():
	var bolhas : Array[Area2D] = area.get_overlapping_areas()
	
	if bolhas.is_empty():
		bolhaProx = null
		return
	
	var distMin = (bolhas[0].global_position - global_position).length()
	var retorno = bolhas[0]
	for b in bolhas:
		var dist = (b.global_position - global_position).length()
		if dist < distMin:
			retorno = b
			distMin = dist
	bolhaProx = retorno
	bolhaProx.inFocus = true
	Engine.time_scale = 0.01
	colorRect.visible = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Espaco"):
		if Input.is_action_pressed("Cima") and Engine.time_scale == 1:
			get_tree().paused = true
			SceneController.setPositionFocus(global_position)
			SceneController.reloadCurrentScene("CircleToon")
		else:
			getProxBolha()
