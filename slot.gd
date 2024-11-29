extends Node2D

var childorder : Array[Node]
var holdAmount : float = 0
var holding = false
var speed = 1.6

@export var myTurn : bool = false
@export var pass_to : Node

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
			child.position.y += speed * speedMulyPos
		
		
	pass
	
func _input(event: InputEvent) -> void:
	if (myTurn):
		if (event is InputEventKey or event is InputEventMouseButton or event is InputEventScreenTouch):
			if (event.is_pressed()):
				holding = true
			elif (event.is_released()):
				print(holdAmount)
				if (holding):
					if (holdAmount < 1):
						myTurn = false
						await returnToOne()
						if (pass_to != null):
							pass_to.myTurn = true
			
				holdAmount = 0
				holding = false
	
	
func returnToOne():
	var nearestNodePos : float = childorder[0].position.y
	for n in range(1, childorder.size()):
		if abs(childorder[n].position.y) < abs(nearestNodePos):
			nearestNodePos = childorder[n].position.y
	for child in childorder:
		child.position.y -= nearestNodePos
		
	
	
