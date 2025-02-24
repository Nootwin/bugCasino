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
	if (type == "BUG"):
		if (name == "Slot" or get_child_count() < 1):
			for children in get_children():
				remove_child(children)
		
		
			for children in $"/root/Global".bugs:
				if (children != null):
					var child = children.duplicate(5)
					child.setini(children.value, children.color, children.bugType, children)
					add_child(child)
	childorder = get_children()
	childorder.shuffle()
	var x = 86
	for child in childorder:
		child.position.y = x
		x -= 86
	
	

func change_children (array : Array[Node]):
	for child in get_children():
		remove_child(child)
		
	for children in array:
		var child = children.duplicate(5)
		child.setini(children.value, children.color, children.bugType, children.original)
		add_child(child)

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
			child.position.y += speed * (speedMulyPos + $"/root/Global".speed)
		
		
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
							if (pass_to is Slot and pass_to.type == "BUG"):
								var newchildren = get_children()
								newchildren.erase(chosen)
								pass_to.change_children(newchildren)
								pass_to.init()
							pass_to.startMyTurn()
							pass_to.myTurn = true
					elif (name == "Slot"):
						myTurn = false
						$"../PointsManager".changeSpeed(1.0)
						$"../PointsManager".sleepStartMyTurn()
						$"../PointsManager".myTurn = true
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
	
		for pointsource in lookForPoints:
			if (pointsource is Slot):
				if (pointsource.type == "BUG"):
					if (chosen.bugType == pointsource.chosen.bugType || chosen.bugType == Globals.BUG_TYPES.CRICKET || pointsource.chosen.bugType == Globals.BUG_TYPES.CRICKET):
						manager.addMult(3)
						$"../multSound".play()
						$"../multSound".pitch_scale += 0.1
						$"../Camera2D".applyShake()
						await lights.spotlightIt(self.position, pointsource.position, "[center]Same Bug")
						
					if (chosen.color == pointsource.chosen.color || chosen.color == Color("ffffff") || pointsource.chosen.color == Color("ffffff")):
						manager.addMult(2)
						$"../multSound".play()
						$"../multSound".pitch_scale += 0.1
						$"../Camera2D".applyShake()
						await lights.spotlightIt(self.position, pointsource.position, "[center]Same Colour")
						
			elif (pointsource is DealerHand):
				for card in pointsource.get_children():
					
					if (chosen.bugType == card.bug):
						manager.addPoints(card.pointValue() * chosen.value)
						$"../multSound".play()
						$"../multSound".pitch_scale += 0.1
						$"../Camera2D".applyShake()
						await lights.spotlightIt(self.position, card.global_position, "[center]Same Bug")
						
					if (chosen.color == card.color):
						manager.addPoints(card.pointValue() * chosen.value)
						$"../multSound".play()
						$"../multSound".pitch_scale += 0.1
						$"../Camera2D".applyShake()
						await lights.spotlightIt(self.position, card.global_position, "[center]Same Colour")
						
	else:
		manager.mulMult(chosen.value)	
			
func startMyTurn():
	pass
