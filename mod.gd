class_name Mod extends Sprite2D

enum MODTYPE {RED_MORE, GREEN_MORE, BLUE_MORE, YELLOW_MORE, BEE_MORE, DRAGONFLY_MORE, ANT_MORE, LADYBUG_MORE, SPIDER_MORE, WORM_MORE, EXTRA_TURN, THREE_MULT}

@export var modType : MODTYPE

static var modTexts = ["Red Cards Appear more", "Green Cards Appear more", "Blue Cards Appear more", "Yellow Cards Appear more", "Bee Cards Appear more", "Dragonfly Cards Appear more", "Ant Cards Appear more", "Ladybug Cards Appear more", "Spider Cards Appear more", "Worm Cards Appear more", "+1 Turns", "+3 Mult"]
# Called when the node enters the scene tree for the first time.

func start_of_floor():
	if modType == MODTYPE.EXTRA_TURN:
		$"/root/Global".turns += 1
		$"../../PointsManager".turnText.text = str($"/root/Global".turns)
func post_calc():
	if modType == MODTYPE.THREE_MULT:
		$"../../PointsManager".addMult(3)
	
func on_first_dealt(dealer):
	print(modType)
	if modType == MODTYPE.RED_MORE:
		dealer.colors.push_back(Color("e81036"))
	elif modType == MODTYPE.GREEN_MORE:
		dealer.colors.push_back(Color("40f470"))
	elif modType == MODTYPE.BLUE_MORE:
		dealer.colors.push_back(Color("157bf4"))
	elif modType == MODTYPE.YELLOW_MORE:
		dealer.colors.push_back(Color("ffd559"))
	elif modType == MODTYPE.BEE_MORE:
		dealer.bugTypes.push_back(Globals.BUG_TYPES.BEE)
	elif modType == MODTYPE.DRAGONFLY_MORE:
		dealer.bugTypes.push_back(Globals.BUG_TYPES.DRAGONFLY)
	elif modType == MODTYPE.ANT_MORE:
		dealer.bugTypes.push_back(Globals.BUG_TYPES.ANT)
	elif modType == MODTYPE.LADYBUG_MORE:
		dealer.bugTypes.push_back(Globals.BUG_TYPES.LADYBUG)
	elif modType == MODTYPE.SPIDER_MORE:
		dealer.bugTypes.push_back(Globals.BUG_TYPES.SPIDER)
	elif modType == MODTYPE.WORM_MORE:
		dealer.bugTypes.push_back(Globals.BUG_TYPES.WORM)
