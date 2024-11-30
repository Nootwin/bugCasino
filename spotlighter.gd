extends CanvasModulate


func spotlightIt(pos1 : Vector2, pos2 : Vector2, text : String):
	$PointLight2D.position = pos1
	$PointLight2D2.position = pos2
	$PointLight2D2/RichTextLabel.text = text
	await get_tree().create_timer(1).timeout


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
