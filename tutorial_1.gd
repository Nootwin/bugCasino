extends Node2D

var pointLightID : int = 0
@export var stopPoint : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if ($"/root/Global".floor != 1):
		get_tree().paused = false
		queue_free()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if ((event is InputEventKey or event is InputEventMouseButton or event is InputEventScreenTouch) and event.is_released()):
		if (pointLightID > stopPoint):
			queue_free()
		else:
			get_node("CanvasModulate/PointLight2D" + str(pointLightID)).visible = false
			pointLightID += 1
			get_node("CanvasModulate/PointLight2D" + str(pointLightID)).visible = true
	
	
		pass
	
