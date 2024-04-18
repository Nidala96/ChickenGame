extends CharacterBody2D

#player movement variables
@export var runSpeed = 100
@export var walkSpeed = 50
@export var jumpSpeed = -240
@export var gravityForce = 240
@onready var horizontalInput
@export var coyoteTime : float = 10
@export var playerHealth : float = 100
@export var jumpImpede = -2
var holdingJump = false
var gotHit = false
var JumpAvailable = false
var isDead = false
var isWalking = false

var playerSound := AudioStreamPlayer.new()

func _ready():
	add_child(playerSound)
	
	
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
	death()
	gameOver()
	walk()
	#control if player is on floor every frame
	#last_floor = is_on_floor()

func horizontal_movement():
	# if keys are pressed it will return 1 for right, -1 for left, and 0 for neither
	horizontalInput = Input.get_action_strength("right") -  Input.get_action_strength("left")
	# horizontal velocity which moves player left or right based on input
	if isWalking:
		velocity.x = horizontalInput * walkSpeed
		print("walk")
	else:
		velocity.x = horizontalInput * runSpeed
		
func walk():
	if Input.is_action_just_pressed("walk") and is_on_floor():
		isWalking = true
	elif Input.is_action_just_released("walk"):
		isWalking = false
		
		

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
	if Input.is_action_just_released("jump") && velocity.y < 0:
		velocity.y = 0;
			
	
func gravity(delta):
	if not is_on_floor():
		if JumpAvailable:
			get_tree().create_timer(coyoteTime).timeout.connect(Coyote_Timeout)
		velocity.y += gravityForce * delta
	else:
		JumpAvailable = true
		
func player_take_damage(damage):
	playerHealth -= damage
	#Handle SFX
	playerSound.stream = load("res://Sound/SFX/player_hurt.ogg")
	playerSound.play()
	gotHit = true
	
func Coyote_Timeout():
	JumpAvailable = false
	
func death():
	if playerHealth <= 0:
		isDead = true

func gameOver():
	if isDead:
		get_tree().change_scene_to_file("res://Scenes/ui.tscn")
		
	
