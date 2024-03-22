extends CharacterBody2D

@export var healthPoints : int = 3
@export var moveSpeed : int = 30

var motion : Vector2 = Vector2()
var left : Vector2 = Vector2(-1,0)
var right : Vector2 = Vector2(1,0)
var direction = right

func _physics_process(delta):
	animation_states()
	walk()
	move_and_slide()
	turn()
	sprite_flip()

func walk():
	velocity.x = moveSpeed * direction.x

func turn():
	if is_on_wall():
		if direction == left:
			direction = right
			print("turnA")
		elif direction == right:
			direction = left
			print("turnB")
			

func animation_states():
	if velocity.x > 0:
		%BaseChickenSprite.play("run")

func sprite_flip():
	if direction == right:
		%BaseChickenSprite.flip_h = false
	elif direction == left:
		%BaseChickenSprite.flip_h = true
