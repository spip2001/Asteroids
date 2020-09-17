extends Node2D

signal end


func reinit() :
	get_node("AsteroidSpawn").reinit()
	get_node("background").reinit()
	


func _on_background_end():
	emit_signal("end")
