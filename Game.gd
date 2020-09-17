extends Node2D

signal game_over
signal victory

var earthLife = 10

export var decay = 0.8  # How quickly the shaking stops [0, 1].
export var max_offset = Vector2(4, 4)  # Maximum hor/ver shake in pixels.
export var max_roll = 0.1  # Maximum rotation in radians (use sparingly).
export var shakeduration = 0.2
var shake:float = 0
var shaking:bool = false


func _ready():
	pass # Replace with function body.
	
func reinit() :
	earthLife = 10
	shaking = false
	shake = 0
	get_node("Space").reinit()
	get_node("Player").reinit()
	for asteroid in get_tree().get_nodes_in_group("Asteroid"):
		asteroid.queue_free()
	
func _process(delta):
	if shaking:
		shake += delta
		if shake > shakeduration :
			rotation_degrees = 0
			position.x = 0
			position.y = 0
			shaking = false

func shake():
	if !shaking:
		shaking = true
		shake = 0
		rotation_degrees = max_roll * rand_range(-1, 1)
		position.x = max_offset.x * rand_range(-1, 1)
		position.y = max_offset.y * rand_range(-1, 1)
		get_node("EarthDamageZone/OuchSound").play()


func _on_EarthDamageZone_area_entered(area):
	if area.is_in_group("Asteroid") :
		earthLife = earthLife - 1
		shake()
	if earthLife <= 0 :
		emit_signal("game_over")

func _on_Player_destroyed():
	emit_signal("game_over")


func _on_Space_end():
	emit_signal("victory")
