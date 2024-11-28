class_name Globals extends Node2D

enum BUG_TYPES {WORM, BEE, SPIDER, ANT, LADYBUG, DRAGONFLY}
var colors : Array[Color] = [Color("e81036"), Color("40f470"), Color("157bf4"), Color("ffd559")]

var bugPNGS = {
	BUG_TYPES.WORM : load("res://art/worm.png"),
	BUG_TYPES.BEE : load("res://art/bumblle.png"),
	BUG_TYPES.SPIDER : load("res://art/spider.png"),
	BUG_TYPES.ANT : load("res://art/fireant.png"),
	BUG_TYPES.LADYBUG : load("res://art/ladybug.png"),
	BUG_TYPES.DRAGONFLY : load("res://art/dragonfly.png")
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
