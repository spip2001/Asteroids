extends Node2D

const NO_UPGRADE = 0
const SHIELD = 1
const DOUBLE_SHOT = 2
const SATTELITE = 3

const MAX_UPGRADE = 4

const NODES = ["", "Shield", "DoubleShot", "Sattelite", "Sattelite2"]

var currentUpgrade = 0


func _ready():
	updateUpgrades()
	
func reinit():
	currentUpgrade = 0
	updateUpgrades()
	
func enable(item:String) :
	get_node(item).show()
	get_node(item).set_process(true)
	
func disable(item:String) :
	get_node(item).hide()
	get_node(item).set_process(false)	
	
func shoot() :
	for i in range(1, currentUpgrade + 1) :
		if get_node(NODES[i]).has_method("shoot") :
			get_node(NODES[i]).shoot()
	
func updateUpgrades() :
	for i in range(1, currentUpgrade + 1) :
		enable(NODES[i])
	for i in range(currentUpgrade + 1, MAX_UPGRADE + 1) :
		disable(NODES[i])
	
func powerUp() :
	if currentUpgrade < MAX_UPGRADE :
		currentUpgrade = currentUpgrade + 1
	updateUpgrades()
	
func powerDown() -> bool :
	var result = false
	if currentUpgrade > 0 :
		result = true
		currentUpgrade = currentUpgrade - 1
	updateUpgrades()
	return result	
