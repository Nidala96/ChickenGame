extends AnimatedSprite2D

var buttonPressed:bool = false

var chickenSound := AudioStreamPlayer.new()

func _ready():
	%ChickenPlayButton.play("idle")
	add_child(chickenSound)

func _on_play_button_pressed():
	buttonPressed = true
	%ChickenPlayButton.play("dead")
	chickenSound.stream = load("res://Sound/SFX/chichen_dead_1.ogg")
	chickenSound.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/house.tscn")

func _on_play_button_mouse_entered():
	if buttonPressed == false:
		%ChickenPlayButton.play("run")
		chickenSound.stream = load("res://Sound/SFX/chichen_hurt_1.ogg")
		chickenSound.play()
	else:
		return

func _on_play_button_mouse_exited():
	if buttonPressed == false:
		%ChickenPlayButton.play("idle")
		
