extends CharacterBody2D

@export var healthPoints : int = 3
@export var moveSpeed : float = 30
@export var damage : float = 25

var motion : Vector2 = Vector2()
var left : Vector2 = Vector2(-1,0)
var right : Vector2 = Vector2(1,0)
var direction = right

func _physics_process(delta):
	animation_states()
	turn()
	movement()
	sprite_flip()
	move_and_slide()

func movement():
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
	#elif velocity.x == 0:
		#%BaseChickenSprite.play("idle")

func sprite_flip():
	if direction == right:
		%BaseChickenSprite.flip_h = false
	elif direction == left:
		%BaseChickenSprite.flip_h = true
	

func _on_area_2d_body_entered(body):
	if body.has_method("player_take_damage"):
		body.player_take_damage(damage)
