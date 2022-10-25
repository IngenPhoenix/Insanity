extends Area2D

signal LoadKey

var canAction = true

func _ready():
	if self.name in ColorChanger.keyFound:
		queue_free()

func _on_ActionItem_area_entered(area):
	if area.is_in_group("Action"):
		$AnimationPlayer.play("Action1")
		$Glitter.queue_free()

func _on_CollectItem_body_entered(body):
	if body.is_in_group("Character"):
		ColorChanger.keyFound.append(self.name)
		canAction = false
		queue_free()
		LoadSprite(body)

func LoadSprite(body):
	if self.is_in_group("Key"):
		emit_signal("LoadKey")
