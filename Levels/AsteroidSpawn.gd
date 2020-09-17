extends Node2D


export (float) var spawnDelay = 1
var lastAsteroid = 0
var doSpawn:bool = true

var asteroid_scene = preload("Asteroid.tscn")

var maxX:int;

func _ready():
	maxX = get_viewport_rect().size.x
	
func reinit() :
	doSpawn = true
	lastAsteroid = 0


func _process(delta):
	if doSpawn :
		lastAsteroid += delta
		if lastAsteroid > spawnDelay :
			var asteroid = asteroid_scene.instance()
			asteroid.position.y = position.y
			asteroid.position.x = rand_range(0, maxX);
			get_node("..").add_child(asteroid)
			lastAsteroid = 0

func _stopSpawning() :
	doSpawn = false
