extends CharacterBody2D

@export var healthPoints : int = 3
@export var moveSpeed : float = 30
@onready var playerBody = $"../Player"

var motion : Vector2 = Vector2()
var left : Vector2 = Vector2(-1,0)
var right : Vector2 = Vector2(1,0)
var direction = right

func _physics_process(delta):
	animation_states()
	movement()
	move_and_slide()
	turn()
	sprite_flip()

func movement():
	if is_on_ceiling() && not is_on_wall():
		velocity.x = 0
		print("ceiling")
	else:
		velocity.x = moveSpeed * direction.x

func turn():
	if is_on_wall():
		if direction == left:
			direction = right
		elif direction == right:
			direction = left
			

func animation_states():
	if velocity.x > 0:
		%BaseChickenSprite.play("run")

func sprite_flip():
	if direction == right:
		%BaseChickenSprite.flip_h = false
	elif direction == left:
		%BaseChickenSprite.flip_h = true
	elif velocity.x == 0:
		%BaseChickenSprite.play("idle")
