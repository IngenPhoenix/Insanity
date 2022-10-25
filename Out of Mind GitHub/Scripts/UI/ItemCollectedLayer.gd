extends CanvasLayer

onready var sprite1 = $Sprite
onready var sprite2 = $Sprite2
onready var sprite3 = $Sprite3
onready var sprite4 = $Sprite4

var sprite1Loaded = false
var sprite2Loaded = false
var sprite3Loaded = false
var sprite4Loaded = false

func _on_Door_LoadKey():
	if !sprite1.texture and sprite1Loaded == false:
		sprite1.texture = load("res://Sprites/Doors/Key.png")
		sprite1Loaded = true
	
	if !sprite2.texture and sprite2Loaded == false:
		sprite2.texture = load("res://Sprites/Doors/Key.png")
		sprite2Loaded = true
		
	if !sprite3.texture and sprite3Loaded == false:
		sprite3.texture = load("res://Sprites/Doors/Key.png")
		sprite3Loaded = true
		
	if !sprite4.texture and sprite4Loaded == false:
		sprite4.texture = load("res://Sprites/Doors/Key.png")
		sprite4Loaded = true
		
func _on_Door_DeleteKey():
	if sprite1Loaded == true and sprite1.texture == load("res://Sprites/Doors/Key.png"):
		sprite1.texture = null
		sprite1Loaded = false
		
	if sprite2Loaded == true and sprite2.texture == load("res://Sprites/Doors/Key.png"):
		sprite2.texture = null
		sprite2Loaded = false
		
	if sprite3Loaded == true and sprite3.texture == load("res://Sprites/Doors/Key.png"):
		sprite3.texture = null
		sprite3Loaded = false
		
	if sprite4Loaded == true and sprite4.texture == load("res://Sprites/Doors/Key.png"):
		sprite4.texture = null
		sprite4Loaded = false
