extends StaticBody2D

var appleSound := AudioStreamPlayer.new()
var eventCompleted = false
var eventSound := AudioStreamPlayer.new()
@export var waitTime = 0.1
var appleSprite = Sprite2D
var applePicked = false

func _ready():
	appleSprite = %Sprite2D
	add_child(appleSound)
	add_child(eventSound)
	if Global.eventSoundPlayed:
		queue_free()

func _on_area_2d_body_entered(body):
	if body.has_method("walk") && !Global.eventSoundPlayed:
		play_apple_sound()
		Global.chickenEvent = true
		if !Global.eventSoundPlayed:
			Global.eventSoundPlayed = true
			print(Global.eventSoundPlayed)
			play_event_sound()
		appleSprite.hide()
		
func play_apple_sound():
		print("sound")
		appleSound.stream = load("res://Sound/SFX/apple_pop.ogg")
		appleSound.play()
		
func play_event_sound():
		eventSound.stream = load("res://Sound/SFX/chicken_shots.ogg")
		eventSound.play()



