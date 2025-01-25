extends RigidBody2D
class_name Player

var torque : float = 5000 #Testei esse valor aq e deu certo. Podemos alterar depois, mas aqui ele consegue subir 30 graus sem problemas
var direcao : float

var bolhaProx : BolhaController
@onready var area: Area2D = $Area2D


func _process(delta: float) -> void:
	direcao = Input.get_axis("Esquerda", "Direita")
	
	if Input.is_action_pressed("Espaco") and bolhaProx:
		if Input.is_action_just_pressed("Direita") or Input.is_action_just_pressed("Esquerda"):
			bolhaProx.mudarEstado()
		Engine.time_scale = 0.01
	if Input.is_action_just_released("Espaco"):
		Engine.time_scale = 1

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	state.apply_torque(direcao * torque)

func _on_area_2d_area_entered(area: Area2D) -> void:
	var bolha = area as BolhaController
	if not bolha:
		return
	bolhaProx = bolha


func _on_area_2d_area_exited(area: Area2D) -> void:
	var bolha = area as BolhaController
	if not bolha:
		return
	if area.has_overlapping_areas():
		bolhaProx = area.get_overlapping_areas()[0].get_script()
	else:
		bolhaProx = null
	pass # Replace with function body.
