class_name Slot extends Node2D

var childorder : Array[Node]
var holdAmount : float = 0
var holding = false
var speed = 1.6
var chosen : Node

@export var myTurn : bool = false
@export var pass_to : Node
@export_enum("BUG", "MUL") var type : String
@export var lookForPoints : Array[Node]

@export var speedMulyPos : float = 1

func init():
	childorder = get_children()
	childorder.shuffle()
	var x = 86
	for child in childorder:
		child.position.y = x
		x -= 86
	


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
			if child.position.y > 172:
				child.position.y = -86 * childorder.size() + 172
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
					if (holdAmount < 0.5):
						myTurn = false
						await returnToOne()
						if (pass_to != null):
							pass_to.startMyTurn()
							pass_to.myTurn = true
			
				holdAmount = 0
				holding = false
	
	
func returnToOne():
	var nearestNodePos : float = childorder[0].position.y
	chosen = childorder[0]
	for n in range(1, childorder.size()):
		if abs(childorder[n].position.y) < abs(nearestNodePos):
			nearestNodePos = childorder[n].position.y
			chosen = childorder[n]
	for child in childorder:
		child.position.y -= nearestNodePos
		
func countPoints():
	var manager = $"../PointsManager"
	var lights = $"../CanvasModulate"
	
	if (type == "BUG"):
		manager.addPoints(chosen.value)
	
		for pointsource in lookForPoints:
			if (pointsource is Slot):
				if (pointsource.type == "BUG"):
					if (chosen.bugType == pointsource.chosen.bugType):
						manager.addMult(3)
						await lights.spotlightIt(self.position, pointsource.position, "[center]Same Bug")
					if (chosen.color == pointsource.chosen.color):
						manager.addMult(2)
						await lights.spotlightIt(self.position, pointsource.position, "[center]Same Colour")
			elif (pointsource is DealerHand):
				for card in pointsource.get_children():
					
					if (chosen.bugType == card.bug):
						manager.addPoints(card.pointValue())
						await lights.spotlightIt(self.position, card.global_position, "[center]Same Bug")
					if (chosen.color == card.color):
						manager.addPoints(card.pointValue())
						await lights.spotlightIt(self.position, card.global_position, "[center]Same Colour")
	else:
		manager.mulMult(chosen.value)	
			
func startMyTurn():
	pass
