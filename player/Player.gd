extends Area2D

signal destroyed

export (int) var MAX_SPEED # how fast the player will move (pixels/sec)
export (int) var ACC # Acceleration

var motion:Vector2 = Vector2() # current motion 
var screensize:Vector2
var shot_scene = preload("Shot.tscn")
var shootDelay = 0.5
var lastShot = 10
var powerUpDelay = 1
var lastPowerUp = 10

onready var maxSpeedSquared = MAX_SPEED * MAX_SPEED
onready var animTree:AnimationTree = $Sprite/AnimationTree
onready var stateMachine:AnimationNodeStateMachinePlayback = animTree["parameters/playback"]

func _ready():
	screensize = get_viewport_rect().size;
	
func reinit() :
	lastShot = 10
	lastPowerUp = 10
	motion.x = 0
	motion.y = 0
	get_node("Upgrade").reinit()

func _process(delta):
	lastPowerUp += delta
	_move(delta)
	_shoot(delta)
	
func _shoot(delta):
	lastShot += delta
	if Input.is_action_pressed("ui_accept") and lastShot > shootDelay :
		lastShot = 0
		var shot = shot_scene.instance()
		shot.position.y = position.y - 6
		shot.position.x = position.x
		get_node("..").add_child(shot)
		get_node("Upgrade").shoot()
	
func _move(delta):
	var velocity = Vector2() # the player's movement vector
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * ACC
	else :
		motion.x = 0
		motion.y = 0
		
	motion = motion + velocity;
	if motion.length_squared() > maxSpeedSquared :
		motion = motion.normalized() * MAX_SPEED;
		
	
	if motion.x > 10 :
		stateMachine.travel("turning")
		$Sprite.flip_h = false
	elif motion.x < -10 :
		stateMachine.travel("turning")
		$Sprite.flip_h = true
	else :
		stateMachine.travel("Idle")
		$Sprite.flip_h = false
	
	position += motion * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, screensize.y / 4, screensize.y)	

func _on_Player_area_entered(area):
	if area.is_in_group("PowerUp") and lastPowerUp > powerUpDelay :
		lastPowerUp = 0;
		get_node("Upgrade").powerUp()
		get_node("PowerUpPlayer").play()
		area.queue_free()
	elif area.is_in_group("Asteroid") :
		var powerDown = get_node("Upgrade").powerDown()
		if powerDown :
			area.destroy()
		else :
			emit_signal("destroyed")
			pass
