extends Node2D

var bugType : Globals.BUG_TYPES
var color : Color
var initd : bool = false
var value : int = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ini()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func setini(valuen, colorn, bugTypen):
	if (!initd):
		bugType = bugTypen
		color = colorn
		value = valuen
		$Sprite2D.texture = $"/root/Global".bugPNGS[bugType]
		$Sprite2D.self_modulate = color
		initd = true
	
func ini():
	if (!initd):
		bugType = randi_range(0, 5)
		color = $"/root/Global".colors[randi_range(0, 3)]
		$Sprite2D.texture = $"/root/Global".bugPNGS[bugType]
		$Sprite2D.self_modulate = color
		initd = true
