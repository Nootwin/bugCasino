extends RichTextLabel
var distance : float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	distance += 0.01
	text = "Distance Traveled: " + str(int(distance)) + "cm"
	pass
