extends Node2D

var childorder : Array[Node]
var holdAmount : int
var holding = true

var myTurn : bool = true

func init():
	childorder = get_children()
	childorder.shuffle()
	var x = 20
	for child in childorder:
		child.position.y = x
		x -= 20
	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init()
	pass # Replace with function body.

func _process(delta: float) -> void:
	if holding:
		holdAmount += delta
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if (myTurn):
		for child in childorder:
			if child.position.y > 40:
				child.position.y = -20 * childorder.size() + 40
			child.position.y += 0.4
		
		
	pass
	
func _input(event: InputEvent) -> void:
	if (event.is_pressed()):
		holding = true
	elif (event.is_released()):
		holdAmount = 0
		holding = false
	
