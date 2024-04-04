extends AnimatedSprite2D

var buttonPressed:bool = false

func _ready():
	%ChickenQuitButton.play("idle")

func _on_quit_button_pressed():
	buttonPressed = true
	%ChickenQuitButton.play("dead")
	await get_tree().create_timer(1).timeout
	get_tree().quit()

func _on_quit_button_mouse_entered():
	if buttonPressed == false:
		%ChickenQuitButton.play("run")
	else:
		return

func _on_quit_button_mouse_exited():
	if buttonPressed == false:
		%ChickenQuitButton.play("idle")
