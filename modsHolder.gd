extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var x
	var y = 0
	for i in $"/root/Global".mods:
		x = i.duplicate(5)
		x.texture.region.position.x = x.modType * 18
		x.position = Vector2(0, y)
		y += 72
		print(x.modType)
		add_child(i.duplicate(5))
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
