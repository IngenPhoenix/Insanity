extends KinematicBody2D

const TILESIZE = 16

onready var animTree = $Animations/AnimationTree
onready var animPlayer = $Animations/AnimationPlayer
onready var animState = animTree.get("parameters/playback")

onready var actionColl = $ActionArea/CollisionShape2D

onready var ray = $RayCast2D

export var speed = 3.0

var percentMoved = 0.0

var initialPos = Vector2(0,0)
var inputDir = Vector2(0,0)

var isMoving = false

func _ready():
	Flash()
	animTree.active = true
	initialPos = position
	animState.start("Idle")

func _physics_process(delta):
	if isMoving == false:
		ProcessPlayerInput()
	elif inputDir != Vector2.ZERO:
		animState.travel("Move")
		Move(delta)
	else:
		animState.travel("Idle")
		isMoving = false
	
	if animState.is_playing() == false:
		return

func ProcessPlayerInput():
	if inputDir.y == 0:
		inputDir.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if inputDir.x == 0:
		inputDir.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	if inputDir != Vector2.ZERO:
		animTree.set("parameters/Idle/blend_position", inputDir)
		animTree.set("parameters/Move/blend_position", inputDir)
		initialPos = position
		isMoving = true
	else:
		animState.travel("Idle")
	
	if Input.is_action_just_pressed("ui_accept"):
		actionColl.disabled = false
		yield(get_tree().create_timer(0.1),"timeout")
		actionColl.disabled = true

func Move(delta):
	var desiredStep :Vector2 = inputDir * TILESIZE / 2
	
	ray.cast_to = desiredStep
	ray.force_raycast_update()
	if !ray.is_colliding():
		percentMoved += speed * delta
		if percentMoved >= 1.0:
			position = initialPos + (TILESIZE * inputDir)
			percentMoved = 0.0
			isMoving = false
		else:
			position = initialPos + (TILESIZE * inputDir * percentMoved)
	else:
		isMoving = false

func Flash():
	var timeTillNextFlash = randi() % 5
		
	match timeTillNextFlash:
		0:
			yield(get_tree().create_timer(5), "timeout")
			$Lightning/AnimationPlayer.play("LightningFlash")
			Flash()
		1:
			yield(get_tree().create_timer(15), "timeout")
			$Lightning/AnimationPlayer.play("LightningFlash")
			Flash()
		2:
			yield(get_tree().create_timer(20), "timeout")
			$Lightning/AnimationPlayer.play("LightningFlash")
			Flash()
		3:
			yield(get_tree().create_timer(12), "timeout")
			$Lightning/AnimationPlayer.play("LightningFlash")
			Flash()
		4:
			yield(get_tree().create_timer(24), "timeout")
			$Lightning/AnimationPlayer.play("LightningFlash")
			Flash()
