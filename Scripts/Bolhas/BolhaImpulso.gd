extends BolhaBase

@export var forcaImpulso : float = 500.0

func encostou(player : Player) -> void:
	var dir = sign(player.linear_velocity.x)
	
	player.angular_velocity = 0
	player.linear_velocity = Vector2.ZERO
	player.apply_impulse(Vector2(dir * forcaImpulso, 0))
