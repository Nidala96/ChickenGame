extends StaticBody2D

var appleSound := AudioStreamPlayer.new()
var eventSound := AudioStreamPlayer.new()

var eventCompleted = false

@export var waitTime = 0.1

func _ready():
	add_child(appleSound)
	add_child(eventSound)

func _on_area_2d_body_entered(body):
	
	if body.has_method("walk"):
		play_apple_sound()
		print(Global.chickenEvent)
		Global.chickenEvent = true
		print(Global.chickenEvent)
		

func play_apple_sound():
		print("sound")
		appleSound.stream = load("res://Sound/SFX/apple_pop.ogg")
		appleSound.play()

func play_chicken_shots():
	eventCompleted = true
	eventSound.stream = load ("res://Sound/SFX/chicken_shots.ogg")
	eventSound.play()


func _chicken_shots(body):
	if body.has_method("walk") and eventCompleted == false and Global.chickenEvent == false:
		play_chicken_shots()
	else:
		return
