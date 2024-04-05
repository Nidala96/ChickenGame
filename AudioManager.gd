extends Node2D

var eventSound := AudioStreamPlayer.new()

func _ready():
	add_child(eventSound)
	
func chickenAssault():
	if Global.chickenEvent:
		print("chicken shot")
		eventSound.stream = load ("res://Sound/SFX/chicken_shots.ogg")
		eventSound.play()
	else:
		return
