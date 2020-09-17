extends Sprite


var speed = -1
var onScreen:bool = false

func _process(delta):
	if onScreen and position.y > -166 :
		position.y += speed * delta
		
func reinit():
	position.y = 0
	onScreen = false
	
func _on_CloudsArea_area_entered(area):
	if area.is_in_group("Player") :
		onScreen = true
