extends Area2D


func _on_Note_area_entered(area):
	if area.is_in_group("Action"):
		queue_free()
