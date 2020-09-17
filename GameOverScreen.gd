extends Node2D


func _ready():
	get_tree().paused = true;

func _process(delta):
	if Input.is_action_pressed("ui_accept") :
		get_node("../TitleScreen").show()
		get_node("../TitleScreen").set_process(true)
		
		hide()
		set_process(false)


func _on_GameOverScreen_visibility_changed():
	get_tree().paused = true;
