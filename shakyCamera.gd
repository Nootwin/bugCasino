extends Camera2D

@export var shakeStrength : float = 30
@export var shakeFade : float = 5.0

var rng = RandomNumberGenerator.new()

var shake = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func applyShake():
	shake = shakeStrength 
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (shake > 0):
		shake = lerpf(shake, 0, shakeFade * delta)
		
		offset = randomOffset()
		
	pass

func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake, shake), rng.randf_range(-shake, shake))
	
