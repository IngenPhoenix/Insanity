extends Node2D

onready var animPlayer = $AnimationPlayer

func _on_Area2D_body_entered(body):
	if body.is_in_group("Character"):
		$Area2D.queue_free()
		var anims = randi() % 3
		
		match anims:
			0:
				animPlayer.play("Leave")
			1:
				animPlayer.play("Leave2")
			2:
				animPlayer.play("Leave3")
				
		yield(get_tree().create_timer(5), "timeout")
		queue_free()
				
	if !animPlayer.is_playing():
		animPlayer.play("Leave")

