extends Sprite2D

@export var myTurn : bool = false
@export var basespeed = 2
@export var multspeed = 2
@export var textForAttack : RichTextLabel
@export var attackValue : float
var attack
var speed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func startMyTurn():
	attack = attackValue
	
	$"../../CanvasLayer/AttackValue".text = "[right]" + str(attack)
	$"../../CanvasLayer/AttackValue".visible = true
	speed = basespeed
	get_parent().rotation_degrees = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (myTurn):
		get_parent().rotation_degrees -= speed
	pass
	
func _input(event: InputEvent) -> void:
	if (myTurn):
		if (event is InputEventKey or event is InputEventMouseButton or event is InputEventScreenTouch):
			if (event.is_released()):
					var stop = fposmod(get_parent().rotation_degrees, 360)
					print("FJIEFJE", stop)
					if ((stop >= 45 and stop <= 90) or (stop >= 225 and stop <= 270)):
						myTurn = false
						attack *= 0.8
						$"../../CanvasLayer/AttackValue".text = "[right]" + str(attack)
						await get_tree().create_timer(0.8).timeout
						get_parent().rotation_degrees = 0
						myTurn = true
						speed *= multspeed
					else:
						
						myTurn = false
						$"../../PointsManager".addSpeed(attack)
						await get_tree().create_timer(0.8).timeout
						$"../../CanvasLayer/AttackValue".visible = false
						$"../../Slot".startMyTurn()
						$"../../Slot".myTurn = true
					
