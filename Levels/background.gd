extends Sprite

signal end

var speed = -2.5;


func _process(delta):
	if position.y > -166 :
		position.y += speed * delta
	else :
		get_node("../AsteroidSpawn")._stopSpawning()
		emit_signal("end")
		
func reinit():
	position.y = 300
	get_node("EarthArea/Earth").reinit()
	get_node("CloudsArea/Clouds").reinit()
