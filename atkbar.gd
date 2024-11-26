extends Sprite2D

var myTurn : bool = false
var speed : float = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if (myTurn):
		$Cursor.position.y -= speed

func _input(event: InputEvent) -> void:	
	if (myTurn):
		if (event is InputEventKey or event is InputEventMouseButton or event is InputEventScreenTouch):
			myTurn = false
