extends AnimatedSprite2D

var buttonPressed:bool = false

var chickenSound := AudioStreamPlayer.new()

func _ready():
	%ChickenQuitButton.play("idle")
	add_child(chickenSound)

func _on_quit_button_pressed():
	buttonPressed = true
	%ChickenQuitButton.play("dead")
	await get_tree().create_timer(1).timeout
	get_tree().quit()

func _on_quit_button_mouse_entered():
	if buttonPressed == false:
		%ChickenQuitButton.play("run")
		chickenSound.stream = load("res://Sound/SFX/chichen_hurt_1.ogg")
		chickenSound.play()
	else:
		return

func _on_quit_button_mouse_exited():
	if buttonPressed == false:
		%ChickenQuitButton.play("idle")
