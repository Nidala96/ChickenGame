extends Area2D

@onready var shotgunSprite = %Shotgun


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_overlapping_bodies().size() == 1:
		print(get_overlapping_bodies().size())
		Global.gunEvent = true
		shotgunSprite.hide()
	if Global.gunEvent:
		shotgunSprite.hide()
