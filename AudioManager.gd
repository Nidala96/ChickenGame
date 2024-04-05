extends Node2D

var eventSound := AudioStreamPlayer.new()
var chickenEventSound = true

func _ready():
	add_child(eventSound)
	
	
#func _process(delta):
	#if Global.chickenEvent && chickenEventSound:
		#eventSound.stream = load ("res://Sound/SFX/chicken_shots.ogg")
		#print("chicken shot")
		#eventSound.play()
		#await get_tree().create_timer(1).timeout
		#chickenEventSound = false
	#else:
		#return
