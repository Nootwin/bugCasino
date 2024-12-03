extends Node2D
var tableState : String = "BASE"
var stop_rotating : bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../RichTextLabel2".text = "[center]" + str($"/root/Global".turns)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!stop_rotating):
		rotation_degrees -= 1 * $"/root/Global".speed
	pass

func _input(event: InputEvent) -> void:
	if (event is InputEventKey or event is InputEventMouseButton or event is InputEventScreenTouch):
		if (event.is_released() and ceil(rotation_degrees) != 45.0):
				var stop = fposmod(rotation_degrees, 360)
				stop_rotating = true
				await get_tree().create_timer(0.8).timeout
				stop_rotating = false
				print(stop)
				if (tableState == "BASE"):
					if (stop >= 0 and stop <= 90):
						tableState = "BUG"
						doBugs()
						pass
					elif (stop >= 90 and stop <= 180):
						tableState = "UPGRADE1"
						doUpgrade()
					elif (stop >= 180 and stop <= 270):
						$"/root/Global".turns -= 1
						if ($"/root/Global".turns < 1):
							get_tree().change_scene_to_file("res://treecasino.tscn")
						else:
							$"../RichTextLabel2".text = "[center]" + str($"/root/Global".turns)
					elif (stop >= 270 and stop <= 360):		
						tableState = "MOD"
						doMod()
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
					bugToAdd.setininew($"../LootTable".get_child(index).value, $"../LootTable".get_child(index).color, $"../LootTable".get_child(index).bugType)
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
				elif (tableState == "UPGRADE1"):
					tableState = "UPGRADE2"
					pass
				elif (tableState == "UPGRADE2"):
					tableState = "UPGRADE3"
				elif (tableState == "UPGRADE3"):
					$"../UpgradesText".visible = false
					$"../LootTable".visible = false
					$"../Slot".visible = false
					$"../Slot2".visible = false
					
					if (stop >= 0 and stop <= 90):
						$"../Slot".chosen.value += 1
						$"../Slot2".chosen.value += 1
					elif (stop >= 90 and stop <= 180):
						if (randi_range(0, 1) == 0):
							$"../Slot".chosen.original.color = Color("ffffff")
							$"../Slot".chosen.original.get_node("Sprite2D").self_modulate = Color("ffffff")
						else:
							$"../Slot".chosen.original.color = Color("ffffff")
							$"../Slot2".chosen.original.get_node("Sprite2D").self_modulate = Color("ffffff")
					elif (stop >= 180 and stop <= 270):
						$"/root/Global".bugs.erase($"../Slot".chosen)
						$"/root/Global".bugs.erase($"../Slot2".chosen)
					elif (stop >= 270 and stop <= 360):		
						if (randi_range(0, 1) == 0):
							$"../Slot".chosen.original.bugType = Globals.BUG_TYPES.CRICKET
							$"../Slot".chosen.original.get_node("Sprite2D").texture = Globals.bugPNGS[Globals.BUG_TYPES.CRICKET]
						else:
							$"../Slot2".chosen.original.bugType = Globals.BUG_TYPES.CRICKET
							$"../Slot2".chosen.original.get_node("Sprite2D").texture = Globals.bugPNGS[Globals.BUG_TYPES.CRICKET]
						pass
					$"/root/Global".turns -= 1
					if ($"/root/Global".turns < 1):
						get_tree().change_scene_to_file("res://treecasino.tscn")
					else:
						$"../RichTextLabel2".text = "[center]" + str($"/root/Global".turns)
					tableState = "BASE"
				elif tableState == "MOD":
					var num : int
					var newmod = load("res://mod.tscn").instantiate()
					if (stop >= 0 and stop <= 90):
						newmod.texture.region = $"../ModText/1S".texture.region
						num = $"../ModText/1S".texture.region.position.x / 18
					elif (stop >= 90 and stop <= 180):
						newmod.texture.region = $"../ModText/2S".texture.region
						num = $"../ModText/2S".texture.region.position.x / 18
					elif (stop >= 180 and stop <= 270):
						newmod.texture.region = $"../ModText/3S".texture.region
						num = $"../ModText/3S".texture.region.position.x / 18
					elif (stop >= 270 and stop <= 360):		
						newmod.texture.region = $"../ModText/4S".texture.region
						num = $"../ModText/4S".texture.region.position.x / 18
						
					
					newmod.modType = num
					
					
					$"/root/Global".mods.push_front(newmod)
					$"../ModText".visible = false
					if ($"/root/Global".mods.size() > 4):
						$"/root/Global".mods.pop_back()
						
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
	
	
func doUpgrade():
	$"../LootTable".visible = true
	$"../Slot".visible = true
	$"../Slot2".visible = true
	
	$"../Slot".init()
	$"../Slot".myTurn = true
	$"../UpgradesText".visible = true
	
func doMod():
	$"../LootTable".visible = true
	
	var rand = randi_range(0, 11)
	
	$"../ModText/1S".texture.region.position = Vector2(rand * 18, 0)
	$"../ModText/1T".text = Mod.modTexts[rand]

	rand = randi_range(0, 11)
	
	$"../ModText/2S".texture.region.position = Vector2(rand * 18, 0)
	$"../ModText/2T".text = Mod.modTexts[rand]
	
	rand = randi_range(0, 11)
	
	$"../ModText/3S".texture.region.position = Vector2(rand * 18, 0)
	$"../ModText/3T".text = Mod.modTexts[rand]
	
	rand = randi_range(0, 11)
	
	$"../ModText/4S".texture.region.position = Vector2(rand * 18, 0)
	$"../ModText/4T".text = Mod.modTexts[rand]
	
	$"../ModText".visible = true
	
