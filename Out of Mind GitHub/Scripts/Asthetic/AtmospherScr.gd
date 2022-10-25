extends Node2D

onready var animPlayer = $AnimationPlayer

func _ready():
	Randomize()

func Randomize():
	
	var anims = randi() % 3
	
	match anims:
		0:
			animPlayer.play("Play")
		1:
			animPlayer.play("Play2")
		2:
			animPlayer.play("Play3")
		
	if !animPlayer.is_playing():
		animPlayer.play("Play")

func _on_AnimationPlayer_animation_finished(anim_name):
	if !anim_name == "RESET":
		Randomize()
