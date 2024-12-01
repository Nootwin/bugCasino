extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation_degrees -= 1
	pass

func _input(event: InputEvent) -> void:
	if (event is InputEventKey or event is InputEventMouseButton or event is InputEventScreenTouch):
		if (event.is_released()):
				var stop = fposmod(rotation_degrees, 360)
				if (stop >= 0 and stop <= 90):
					pass
				elif (stop >= 90 and stop <= 180):
					pass
				elif (stop >= 180 and stop <= 270):
					pass
				elif (stop >= 270 and stop <= 360):		
					pass
