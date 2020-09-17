extends Area2D

export(Vector2) var speed = Vector2(0,0)

func _ready():
	speed.x = (-1 if rand_range(-1,1) < 0 else 1 ) * rand_range(10, 100)
	speed.y = rand_range(10, 100)
	if speed.length_squared() > 100 * 100 :
		speed = speed.normalized() * 100

func _process(delta):
	position += speed * delta

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
