extends Sprite


var rotationSpeed = PI

func _process(delta):
	rotation += rotationSpeed * delta
	var s = 0.75 + (cos(rotation) / 4)
	scale.x = s
	scale.y = s
