extends Node2D
@onready var cardFile = preload("res://card.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func deal():
	var card1 = cardFile.instantiate(1)
	var card2 = cardFile.instantiate(1)
	var card3 = cardFile.instantiate(1)
	var card4 = cardFile.instantiate(1)
	
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
