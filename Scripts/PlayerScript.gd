extends RigidBody2D

var torque : float = 40000 #Testei esse valor aq e deu certo. Podemos alterar depois, mas aqui ele consegue subir 30 graus sem problemas
var direcao : float

func _process(delta: float) -> void:
	direcao = Input.get_axis("Esquerda", "Direita")

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	state.apply_torque(direcao * torque)
