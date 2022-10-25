extends StaticBody2D

signal DeleteKey

onready var animPlayer = $AnimationPlayer

func _on_Area2D_area_entered(area):
	if area.is_in_group("Action"):
		if self.name in ColorChanger.keyFound:
			animPlayer.play("Open")
			emit_signal("DeleteKey")
			yield(animPlayer,"animation_finished")
			ColorChanger.doorOpened = true
			queue_free()
		if !self.name in ColorChanger.keyFound:
			animPlayer.play("Shake")

