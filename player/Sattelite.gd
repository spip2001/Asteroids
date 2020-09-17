extends Area2D


export(int) var R = 24

func _process(delta):
	var t = OS.get_ticks_msec()  / 1000.0
	$"Sattelite".position.x = position.x + (R * cos(t))
	$"Sattelite".position.y = position.x + (R * sin(t))
	$"CollisionShape2D".position.x = position.x + (R * cos(t))
	$"CollisionShape2D".position.y = position.x + (R * sin(t))


func _on_Sattelite_area_entered(area):
	if area.is_in_group("Asteroid") :
		area.destroy()
