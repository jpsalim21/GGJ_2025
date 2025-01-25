extends BolhaBase

@export var forcaImpulso : float

func encostou(body: Node2D) -> void:
	var player = body as Player
	if not player:
		return
	
	player.apply_impulse(Vector2(0, -forcaImpulso))
	
	destruir()
