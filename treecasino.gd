extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if ($"/root/Global".floor == 1):
		pass
	elif ($"/root/Global".floor % 2 == 0):
		$Node/RichTextLabel2.text = "[center]" + str($"/root/Global".floor)
		$Node/RichTextLabel3.text = "[center]" +str($"/root/Global".floor+1)
		$Node/RichTextLabel4.text = "[center]" +str($"/root/Global".floor+2)
		$Node/RichTextLabel5.text = "[center]" +str($"/root/Global".floor+3)
		$Node/RichTextLabel6.text = "[center]" +str($"/root/Global".floor+4)
		$Camera2D.position.y -= 256
	else:
		$Camera2D.position.y -= 512
		$Node/RichTextLabel3.text = "[center]" +str($"/root/Global".floor)
		$Node/RichTextLabel4.text = "[center]" +str($"/root/Global".floor+1)
		$Node/RichTextLabel5.text = "[center]" +str($"/root/Global".floor+2)
		$Node/RichTextLabel6.text = "[center]" +str($"/root/Global".floor+3)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
