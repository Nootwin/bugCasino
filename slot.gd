extends Node2D

var childorder : Array[Node]
var holdAmount : int
var holding = true

var myTurn : bool = true

@export var speedMulyPos : float = 1

func init():
	childorder = get_children()
	childorder.shuffle()
	var x = 80
	for child in childorder:
		child.position.y = x
		x -= 80
	


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
			if child.position.y > 160:
				child.position.y = -80 * childorder.size() + 160
			child.position.y += 1.6 * speedMulyPos
		
		
	pass
	
func _input(event: InputEvent) -> void:
	if (event.is_pressed()):
		holding = true
	elif (event.is_released()):
		holdAmount = 0
		holding = false
	
