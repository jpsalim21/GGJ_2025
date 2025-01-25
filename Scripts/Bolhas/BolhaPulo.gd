extends BolhaBase

@export var forcaImpulso : float = 500.0

func encostou(player : Player) -> void:
	player.linear_velocity = Vector2(player.linear_velocity.x, 0)
	player.apply_impulse(Vector2(0, -forcaImpulso))
