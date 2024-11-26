extends Node2D
var rotation_amount : float = 2
var myTurn : bool = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lay_them_out()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	if (myTurn):
		rotation_degrees -= rotation_amount
		for child in get_children():
			child.rotation_degrees = -rotation_degrees
	
func lay_them_out():
	var numOfChild : float = get_child_count()
	var ratio = 2 * PI/numOfChild
	var x :float = 0
	for child in get_children():
		child.position = Vector2(-120 * sin(x), -120 * cos(x))
		x += ratio

func _input(event: InputEvent) -> void:
	if (myTurn):
		if (event is InputEventKey or event is InputEventMouseButton or event is InputEventScreenTouch):
			myTurn = false
			await rotate_back()
			$"../AtkBar".myTurn = true

func rotate_back():
	var numOfChild : float = get_child_count()
	var ratio = 360/numOfChild
	var target = round(rotation_degrees/ratio)*ratio
	while (abs(rotation_degrees - target) > rotation_amount):
		rotation_degrees = move_toward(rotation_degrees, target, rotation_amount)

		for child in get_children():
			child.rotation = -rotation
		await get_tree().process_frame
			
	
