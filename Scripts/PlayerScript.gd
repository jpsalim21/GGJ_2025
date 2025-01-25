extends RigidBody2D
class_name Player

var torque : float = 5000 #Testei esse valor aq e deu certo. Podemos alterar depois, mas aqui ele consegue subir 30 graus sem problemas
var direcao : float

func _process(delta: float) -> void:
	direcao = Input.get_axis("Esquerda", "Direita")

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	state.apply_torque(direcao * torque)


func _on_area_2d_area_entered(area: Area2D) -> void:
	
	pass # Replace with function body.
