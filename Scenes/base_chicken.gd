extends CharacterBody2D

@export var healthPoints : float = 100
@export var moveSpeed : float = 30
@export var damage : float = 25
@export var gravityForce = 240

@onready var hitBox = %HitBox

var chickenSound := AudioStreamPlayer.new()

var motion : Vector2 = Vector2()
var left : Vector2 = Vector2(-1,0)
var right : Vector2 = Vector2(1,0)
var direction = right

var gotHit : bool = false
var invincible : bool = false
var isDead = false

func _ready():
	add_child(chickenSound)

func _physics_process(_delta):
	animation_states(_delta)
	turn()
	movement()
	sprite_flip()
	move_and_slide()
	death()

func movement():
	if isDead == false:
		velocity.x = moveSpeed * direction.x
	else:
		velocity.x = 0

func turn():
	if is_on_wall() && isDead == false:
		if direction == left:
			direction = right
		elif direction == right:
			direction = left
			

func animation_states(delta):
	if velocity.x != 0 && gotHit == false && isDead == false:
		%BaseChickenSprite.play("run")
	if gotHit == true && isDead == false:
		%BaseChickenSprite.play("hurt")
		await get_tree().create_timer(0.3).timeout
		gotHit = false
	if isDead == true:
		velocity.y += gravityForce * delta
		%BaseChickenSprite.play("death")

func sprite_flip():
	if isDead == false:
		if direction == right:
			%BaseChickenSprite.flip_h = false
		elif direction == left:
			%BaseChickenSprite.flip_h = true
	else:
		return

#emmits if the player touches a chicken 
func _on_hurt_box_body_entered(body):
	if isDead == false:
		if body.has_method("player_take_damage"):
			body.player_take_damage(damage)
	else:
		return

func chicken_take_damage(bulletDamage):
	if isDead == false:
		#Handle SFX
		chickenSound.stream = load("res://Sound/SFX/chichen_hurt_1.ogg")
		chickenSound.play()
		healthPoints -= bulletDamage
		print(healthPoints)
		gotHit = true
		
		if healthPoints <= 0:
			chickenSound.stream = load("res://Sound/SFX/chicken_dead_1.ogg")
			chickenSound.play()

	else:
		return

func death():
	if healthPoints <= 0:
		isDead = true
		
	
