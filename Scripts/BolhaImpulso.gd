extends BolhaBase

@export var forcaImpulso : float

func encostou(body: Node2D) -> void:
	print("Tá chamando")
	var player = body as Player
	if not player:
		return
	
	var dir = sign(player.linear_velocity.x)
	
	player.angular_velocity = 0
	player.linear_velocity = Vector2.ZERO
	player.apply_impulse(Vector2(dir * forcaImpulso, 0))
	
	destruir()
