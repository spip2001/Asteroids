extends Node2D

var waitingDelay:float = 0

func _ready():
	get_tree().paused = true;

func _process(delta):
	waitingDelay += delta
	if waitingDelay > 2 and  Input.is_action_pressed("ui_accept") :
		get_tree().paused = false
		get_node("../Game").reinit()
		hide()
		set_process(false)



func _on_TitleScreen_visibility_changed():
	waitingDelay = 0;
