extends Node2D

var shot_scene = preload("Shot.tscn")

func shoot() :
	var player = get_node("../..");
	
	var shot1 = shot_scene.instance()
	shot1.position.y = player.position.y - 6
	shot1.position.x = player.position.x - 8
	
	var shot2 = shot_scene.instance()
	shot2.position.y = player.position.y - 6
	shot2.position.x = player.position.x + 8
	
	player.get_node("..").add_child(shot1)
	player.get_node("..").add_child(shot2)
