extends CharacterBody2D

#player movement variables
@export var runSpeed = 100
@export var jumpSpeed = -100
@export var gravityForce = 200
@onready var horizontalInput

@export var playerHealth : float = 100
@export var enemyDamage : float = 25

#signal emitted when enemies hit the player
signal hit


#movement and physics
func _physics_process(delta):
	# vertical movement velocity (down)
	gravity(delta)
	jump()
	# horizontal movement processing (left, right)
	horizontal_movement()
	#applies animations
	animation_status()
	#applies movement
	move_and_slide()

func horizontal_movement():
	# if keys are pressed it will return 1 for right, -1 for left, and 0 for neither
	horizontalInput = Input.get_action_strength("right") -  Input.get_action_strength("left")
	# horizontal velocity which moves player left or right based on input
	velocity.x = horizontalInput * runSpeed
	

func animation_status():
	if horizontalInput == 0:
		%PlayerAnimSprite.play("idle")
	elif horizontalInput == 1:
		%PlayerAnimSprite.flip_h = false
		%PlayerAnimSprite.play("run")
	elif horizontalInput == -1:
		%PlayerAnimSprite.flip_h = true
		%PlayerAnimSprite.play("run")
	if velocity.y < 0 or not is_on_floor():
		%PlayerAnimSprite.play("jump")

func jump():
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = jumpSpeed

func gravity(delta):
	if not is_on_floor():
		velocity.y += gravityForce * delta
		


	


func _on_hurt_box_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass # Replace with function body.
