extends Node2D

var myTurn : bool = false
@export var health :float
@export var score : float
@export var points : float
@export var mult : float

@export var healthText : RichTextLabel
@export var scoreText : RichTextLabel
@export var speedText : RichTextLabel
@export var pointsText : RichTextLabel
@export var multText : RichTextLabel
@export var turnText : RichTextLabel
var wheeledYet : bool = false

@export var calcChain : Array[Node]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"/root/Global".turns = 4
	health = $"/root/Global".floor * 500
	speedText.text = str($"/root/Global".speed)
	healthText.text = "[right]" + str(health)
	scoreText.text = "[center]"
	pointsText.text = "0"
	multText.text = "[right] 1.0"
	pass # Replace with function body.

func startMyTurn():

	$"../multSound".pitch_scale = 0.8
	$"../CanvasModulate".visible = true
	for link in calcChain:
		await link.countPoints()
	$"../CanvasModulate".visible = false
	calculateScore()
	await damage()
	if (health > 0):
		$"../DealerHand".deal()
		$"/root/Global".turns -= 1
		if ($"/root/Global".turns < 1):
			pass
		turnText.text = str($"/root/Global".turns)
		if ( $"/root/Global".floor == 1 and !wheeledYet):
			$"/root/Gattlev2/".add_child(load("res://tutorial_2.tscn").instantiate())
			wheeledYet = true
		$"../Node2D/Wheelpointer".startMyTurn()	
		$"../Node2D/Wheelpointer".myTurn = true
		
func sleepStartMyTurn():
	if (health > 0):
		$"../DealerHand".deal()
		$"/root/Global".turns -= 1
		if ($"/root/Global".turns < 1):
			pass
		turnText.text = str($"/root/Global".turns)
		$"../Node2D/Wheelpointer".startMyTurn()	
		$"../Node2D/Wheelpointer".myTurn = true
	
		pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func mulMult(num : float):
	mult *= num
	multText.text = "[right]" + str(mult)	

func addPoints(num : float):
	points += num
	pointsText.text = str(floor(points))
	
func addMult(num : float):
	mult += num
	multText.text = "[right]" + str(mult)	
	
func calculateScore():
	score = mult * points
	scoreText.text = "[center]" + str(score)
	
func addSpeed(num : float):
	$"/root/Global".speed += num
	speedText.text = str($"/root/Global".speed)
	
func changeSpeed(num : float):
	$"/root/Global".speed = num
	speedText.text = str($"/root/Global".speed)
func damage():

	await get_tree().create_timer(1).timeout
	var onetenth = score / 100
	for i in 100:
		score -= onetenth
		health -= onetenth
		healthText.text = "[right]" + str(floor(health))
		scoreText.text = "[center]" + str(score)
		await get_tree().process_frame
		
	health -= score
	health = floor(health)
	if (health <= 0):
		$"/root/Global".floor += 1
		await get_tree().change_scene_to_file("res://rewards.tscn")
	score = 0
	points = 0
	mult = 1
	healthText.text = "[right]" + str(health)
	scoreText.text = "[center]"
	pointsText.text = "0"
	multText.text = "[right] 1.0"
	
