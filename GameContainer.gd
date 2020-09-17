extends Node2D


func _on_Gam_over():
	get_tree().paused = true;
	$"GameOverScreen".show()
	$"GameOverScreen".set_process(true)


func _on_Game_victory():
	get_tree().paused = true;
	$"VictoryScreen".show()
	$"VictoryScreen".set_process(true)
