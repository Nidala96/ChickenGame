extends AnimatedSprite2D

var buttonPressed:bool = false

func _ready():
	%ChickenPlayButton.play("idle")

func _on_play_button_pressed():
	buttonPressed = true
	%ChickenPlayButton.play("dead")
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/house.tscn")

func _on_play_button_mouse_entered():
	if buttonPressed == false:
		%ChickenPlayButton.play("run")
	else:
		return

func _on_play_button_mouse_exited():
	if buttonPressed == false:
		%ChickenPlayButton.play("idle")
		
