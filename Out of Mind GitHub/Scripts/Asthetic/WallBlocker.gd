extends Area2D

onready var animPlayer = $AnimationPlayer

func _ready():
	$Sprite.visible = true

func _on_WallBlocker_body_entered(body):
	if body.is_in_group("Character"):
		animPlayer.play("Fade In")


func _on_WallBlocker_body_exited(body):
	if body.is_in_group("Character"):
		animPlayer.play("Fade Out")
