extends CharacterBody2D

#player movement variables
@export var runSpeed = 100
@export var jumpSpeed = -100
@export var gravityForce = 200
@onready var horizontalInput
@export var coyoteTime : float = 10

@export var playerHealth : float = 100
var gotHit = false
var JumpAvailable = false
	
	
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
	#control if player is on floor every frame
	#last_floor = is_on_floor()

func horizontal_movement():
	# if keys are pressed it will return 1 for right, -1 for left, and 0 for neither
	horizontalInput = Input.get_action_strength("right") -  Input.get_action_strength("left")
	# horizontal velocity which moves player left or right based on input
	velocity.x = horizontalInput * runSpeed
	

func animation_status():
	if gotHit == true:
		%PlayerAnimSprite.play("hurt")
		await get_tree().create_timer(0.2).timeout
		gotHit = false
	elif horizontalInput == 0 && gotHit == false:
		%PlayerAnimSprite.play("idle")
	elif horizontalInput == 1 && gotHit == false:
		%PlayerAnimSprite.flip_h = false
		%PlayerAnimSprite.play("run")
	elif horizontalInput == -1 && gotHit == false:
		%PlayerAnimSprite.flip_h = true
		%PlayerAnimSprite.play("run")
	if velocity.y < 0 or not is_on_floor():
		%PlayerAnimSprite.play("jump")

func jump():
	if Input.is_action_just_pressed("jump") and JumpAvailable:
		velocity.y = jumpSpeed
		JumpAvailable = false
	
	
		

func gravity(delta):
	if not is_on_floor():
		if JumpAvailable:
			get_tree().create_timer(coyoteTime).timeout.connect(Coyote_Timeout)
		velocity.y += gravityForce * delta
	else:
		JumpAvailable = true
		
func player_take_damage(damage):
	playerHealth -= damage
	gotHit = true
	
func Coyote_Timeout():
	JumpAvailable = false
