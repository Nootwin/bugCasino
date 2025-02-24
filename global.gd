class_name Globals extends Node2D

enum BUG_TYPES {WORM, BEE, SPIDER, ANT, LADYBUG, DRAGONFLY, CRICKET}
static var colors : Array[Color] = [Color("e81036"), Color("40f470"), Color("157bf4"), Color("ffd559"), Color("ffffff")]

var floor = 1
var turns : int = 0
var speed : float = 1.0

@export var bugs : Array[Bug]

var mods : Array[Mod]

static var bugPNGS = {
	BUG_TYPES.WORM : load("res://art/worm.png"),
	BUG_TYPES.BEE : load("res://art/bumblle.png"),
	BUG_TYPES.SPIDER : load("res://art/spider.png"),
	BUG_TYPES.ANT : load("res://art/fireant.png"),
	BUG_TYPES.LADYBUG : load("res://art/ladybug.png"),
	BUG_TYPES.DRAGONFLY : load("res://art/dragonfly.png"),
	BUG_TYPES.CRICKET : load("res://art/cricket.png")
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mods.push_front(load("res://mod.tscn").instantiate())
	mods.push_front(load("res://mod.tscn").instantiate())
	mods.push_front(load("res://mod.tscn").instantiate())
	
	var bugFile = load("res://Ug.tscn")
	var color = Color("e81036")
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.WORM)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.BEE)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.SPIDER)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.ANT)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.LADYBUG)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.DRAGONFLY)
	
	color = Color("40f470")
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.WORM)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.BEE)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.SPIDER)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.ANT)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.LADYBUG)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.DRAGONFLY)
	
	color = Color("157bf4")
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.WORM)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.BEE)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.SPIDER)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.ANT)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.LADYBUG)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.DRAGONFLY)
	
	color = Color("ffd559")
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.WORM)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.BEE)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.SPIDER)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.ANT)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.LADYBUG)
	bugs.push_front(bugFile.instantiate())
	bugs.front().setininew(1, color, BUG_TYPES.DRAGONFLY)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
