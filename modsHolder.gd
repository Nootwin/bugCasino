extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var x
	var y = 0
	for i in $"/root/Global".mods:
		x = i.duplicate(5)
		x.texture = AtlasTexture.new()
		x.texture.atlas = load("res://art/mods.png")
		x.texture.region.size = Vector2(18, 18)
		x.texture.region.position = Vector2(x.modType * 18, 0)
		x.position = Vector2(y, 0)
		y += 72
		print(x.modType)
		add_child(x)
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
