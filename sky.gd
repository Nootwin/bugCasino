extends Node2D
@onready var onex = $"3".texture.get_width() * scale.x
@onready var twox = $"4".texture.get_width() * scale.x
@onready var threex = $"5".texture.get_width() * scale.x


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	$"5".position.x -= 0.2
	if ($"5".position.x < -(threex-1)):
		$"5".position.x = 0
	$"4".position.x -= 0.1
	if ($"4".position.x < -(twox-1)):
		$"4".position.x = 0
	$"3".position.x -= 0.05
	if ($"3".position.x < -(onex-1)):
		$"3".position.x = 0
	pass
