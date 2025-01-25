extends BolhaBase

@export var forcaImpulso : float = 500.0

func encostou(player : Player) -> void:
	
	player.apply_impulse(Vector2(0, -forcaImpulso))
