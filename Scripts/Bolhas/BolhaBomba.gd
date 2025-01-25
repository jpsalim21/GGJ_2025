extends BolhaBase

@export var forcaImpulso : float = 200.0

var dir
var velocidade = 100
func _ready() -> void:
	set_process(false)

func encostou(player : Player) -> void:
	dir = sign(player.linear_velocity.x)
	
	set_process(true)

func _process(delta: float) -> void:
	get_parent().global_position.x += delta * dir * velocidade
	
