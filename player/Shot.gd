extends Area2D


export(Vector2) var speed = Vector2(0,-200)


func _ready():
	$"ShotSound".play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += speed * delta



func _on_viewport_exited(_viewport):
	queue_free()




func _on_PlayerShot_area_entered(area):
	if area.is_in_group("Asteroid") :
		area.destroy()
		queue_free()
