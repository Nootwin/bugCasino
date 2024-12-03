class_name DealerHand extends Node2D
@onready var cardFile = preload("res://card.tscn")
var colors
var bugTypes 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	colors = Globals.colors.duplicate()
	colors.pop_back()
	bugTypes = Globals.BUG_TYPES.values()
	bugTypes.pop_back()
	for mod in $"../Mods".get_children():
		mod.on_first_dealt(self)
	deal()
	pass # Replace with function body.

func deal():
	for child in get_children():
		child.queue_free()
	var card1 = cardFile.instantiate()
	var card2 = cardFile.instantiate()
	var card3 = cardFile.instantiate()
	var card4 = cardFile.instantiate()
	
	add_child(card1)
	add_child(card2)
	add_child(card3)
	add_child(card4)
	
	card1.rotation = PI
	card2.rotation = PI
	card3.rotation = PI
	card4.rotation = PI
	
	card1.position.x = -120
	card2.position.x = -40
	card3.position.x = 40
	card4.position.x = 120
	
	card1.rotation = PI
	
	card1.get_node("CardE").visible = false
	card2.get_node("CardE").visible = false
	card3.get_node("CardE").visible = false
	card4.get_node("CardE").visible = false
	
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
