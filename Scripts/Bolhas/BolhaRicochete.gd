extends BolhaBase

@export var forcaImpulso : float = 500.0

func encostou(player: Player) -> void:
	
	player.angular_velocity = 0
	var dir = player.linear_velocity
	player.linear_velocity = Vector2(0, 0)
	player.apply_impulse(dir.normalized() * forcaImpulso * Vector2(-1, 1))
