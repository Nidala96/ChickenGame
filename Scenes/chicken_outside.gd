extends CharacterBody2D

@onready var sprite = %BaseChickenSprite
@onready var collisionBody = %HitBox

func _ready():
	if Global.gunEvent:
		collisionBody.set_disabled(false)
		sprite.show()
	else:
		collisionBody.set_disabled(true)
		sprite.hide()
	

	

