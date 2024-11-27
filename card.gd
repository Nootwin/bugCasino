extends Node2D

enum BUG_TYPES {WORM, BEE, SPIDER, ANT, LADYBUG, DRAGONFLY}
var cardNum : int
var bug : BUG_TYPES


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _init() -> void:
	cardNum = randi_range(1, 13)
	$CardF.texture.region.position.x = cardNum
	
