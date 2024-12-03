class_name Bug extends Node2D

var bugType : Globals.BUG_TYPES
var color : Color
var initd : bool = false
var value : int = 1
var original : Bug


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func setininew(valuen, colorn, bugTypen):
	if (!initd):
		bugType = bugTypen
		color = colorn
		value = valuen
		$Sprite2D.texture = Globals.bugPNGS[bugType]
		$Sprite2D.self_modulate = color
		$RichTextLabel.text = str(value)
		initd = true
		
func setini(valuen, colorn, bugTypen, originaln):
	if (!initd):
		bugType = bugTypen
		color = colorn
		value = valuen
		original = originaln
		$Sprite2D.texture = Globals.bugPNGS[bugType]
		$Sprite2D.self_modulate = color
		$RichTextLabel.text = str(value)
		initd = true
	
func ini():
	if (!initd):
		bugType = randi_range(0, 5)
		color = Globals.colors[randi_range(0, 3)]
		$Sprite2D.texture = Globals.bugPNGS[bugType]
		$Sprite2D.self_modulate = color
		value = randi_range(1, floor(sqrt($"/root/Global".floor)) + 1)
		initd = true
		$RichTextLabel.text = str(value)
