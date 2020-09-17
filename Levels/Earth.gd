extends Sprite


var scaleSpeed = 0.1
var onScreen:bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if onScreen and scale.x < 6:
		scale.x += scaleSpeed * delta

func reinit() :
	onScreen = false
	scale.x = 1

func _on_EarthArea_area_entered(area):
	if area.is_in_group("Player") :
		onScreen = true
