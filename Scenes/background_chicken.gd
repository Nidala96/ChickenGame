extends Node2D

func _physics_process(delta):
	animation()

func animation():
	%AnimatedSprite2D.play("idle")
