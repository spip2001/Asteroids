extends Sprite

var rotationSpeed = 2*PI

func _ready():
	rotationSpeed = rand_range(-2, 2) * PI

func _process(delta):
	rotation += rotationSpeed * delta
