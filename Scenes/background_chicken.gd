extends Node2D

func _physics_process(delta):
	animation()
	delete()

func animation():
	%AnimatedSprite2D.play("idle")

func delete():
	if Global.chickenEvent:
		queue_free()
