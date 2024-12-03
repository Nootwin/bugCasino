extends Node2D



var cardNum : int
var bug : Globals.BUG_TYPES
var color : Color


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _enter_tree() -> void:
	cardNum = randi_range(1, 13)
	$CardF.texture.region.position.x = (cardNum-1) * 20
	bug = randi_range(0, get_parent().bugTypes.size()-1)
	$Animal.texture = $"/root/Global".bugPNGS[get_parent().bugTypes[bug]]
	color = get_parent().colors[randi_range(0, get_parent().colors.size()-1)]
	$Animal.self_modulate = color
	$canvas.self_modulate = color
	
func pointValue():
	if cardNum == 1:
		return 11
	elif cardNum > 10:
		return 10
	else:
		return cardNum
