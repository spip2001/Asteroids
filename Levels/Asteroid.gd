extends Area2D

var speed:Vector2 = Vector2(0,50)
var explosion_scene = preload("Explosion.tscn") 
var powerUpScene = preload("../player/PowerUp.tscn")

func _ready():
	speed.y = rand_range(10,50)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += speed * delta



func _on_viewport_exited(_viewport):
	
	queue_free()
	
func destroy() :
	var explosion = explosion_scene.instance()
	explosion.position.x = position.x
	explosion.position.y = position.y
	get_node("..").add_child(explosion)
	
	if rand_range(0,1) > 0.8 :
		var powerUp = powerUpScene.instance();
		powerUp.position.x = position.x
		powerUp.position.y = position.y
		get_node("..").add_child(powerUp)
	
	queue_free()

