extends Node2D
var tableState : String = "BASE"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../RichTextLabel2".text = "[center]" + str($"/root/Global".turns)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation_degrees -= 1
	pass

func _input(event: InputEvent) -> void:
	if (event is InputEventKey or event is InputEventMouseButton or event is InputEventScreenTouch):
		if (event.is_released()):
				
				var stop = fposmod(rotation_degrees, 360)
				print(stop)
				if (tableState == "BASE"):
					if (stop >= 0 and stop <= 90):
						tableState = "BUG"
						doBugs()
						pass
					elif (stop >= 90 and stop <= 180):
						pass
					elif (stop >= 180 and stop <= 270):
						pass
					elif (stop >= 270 and stop <= 360):		
						pass
				elif (tableState == "BUG"):
					var bugToAdd
					var index : int
					if (stop >= 0 and stop <= 90):
						index = 0
					elif (stop >= 90 and stop <= 180):
						index = 1
					elif (stop >= 180 and stop <= 270):
						index = 2
					elif (stop >= 270 and stop <= 360):		
						index = 3
					bugToAdd = $"../LootTable".get_child(index).duplicate(5)
					bugToAdd.scale = Vector2(4, 4)
					bugToAdd.position = Vector2(0, 0)
					bugToAdd.setini($"../LootTable".get_child(index).value, $"../LootTable".get_child(index).color, $"../LootTable".get_child(index).bugType)
					$"/root/Global".bugs.push_front(bugToAdd)
					for children in $"../LootTable".get_children():
						$"../LootTable".remove_child(children)
					$"../LootTable".visible = false
					$"/root/Global".turns -= 1
					if ($"/root/Global".turns < 1):
						get_tree().change_scene_to_file("res://treecasino.tscn")
					else:
						$"../RichTextLabel2".text = "[center]" + str($"/root/Global".turns)
					tableState = "BASE"
					

func doBugs():
	$"../LootTable".visible = true
	var bugFile = load("res://Ug.tscn")
	var bug = bugFile.instantiate()
	$"../LootTable".add_child(bug)
	bug.ini()
	bug.scale = Vector2(1, 1)
	bug.position = Vector2(-50, -50)
	
	bug = bugFile.instantiate()
	$"../LootTable".add_child(bug)
	bug.ini()
	bug.scale = Vector2(1, 1)
	bug.position = Vector2(50, -50)
	
	bug = bugFile.instantiate()
	$"../LootTable".add_child(bug)
	bug.ini()
	bug.scale = Vector2(1, 1)
	bug.position = Vector2(-50, 50)
	
	bug = bugFile.instantiate()
	$"../LootTable".add_child(bug)
	bug.ini()
	bug.scale = Vector2(1, 1)
	bug.position = Vector2(50, 50)
	
	
