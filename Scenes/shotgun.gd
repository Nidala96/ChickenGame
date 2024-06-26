extends Marker2D


var crosshairTexture = preload("res://Assets/crosshair.png")
@onready var bulletSceen = preload("res://Scenes/bullet.tscn")
var node2d
var shotgunSprite
@onready var cdTimer = $CdTimer
var canFire = true
var fireFramesCurrent

var gunshotSound := AudioStreamPlayer.new()

func _ready():
	node2d = %BulletSpawnPoint
	shotgunSprite = %ShotgunSprite
	add_child(gunshotSound)
	
				
func _physics_process(_delta):
	if Global.gunEvent:	
		set_process_input(true)
		shotgunSprite.show()
	else:
		shotgunSprite.hide()
		set_process_input(false)
	var mousePosition = get_global_mouse_position()
	look_at(mousePosition)
	if cdTimer.is_stopped():
		shotgunSprite.rotation_degrees = 0
	rotateGun(mousePosition)
	
	

func _input(_event):
	if Input.is_action_just_pressed("shoot") && cdTimer.is_stopped():
		shoot()
		

func shoot():
	#Handle SFX
	gunshotSound.stream = load("res://Sound/SFX/gunshot.ogg")
	gunshotSound.play()
	var bullet = bulletSceen.instantiate() as Bullet
	get_tree().root.add_child(bullet)
	var move_direction = (get_global_mouse_position() - global_position).normalized()
	bullet.move_direction = move_direction
	bullet.global_position = node2d.global_position
	bullet.rotation = move_direction.angle()
	recoilAnimation()
	cdTimer.start()
	
	
	
func rotateGun(mousePosition):
	var pos = global_position
	var rot = rad_to_deg((mousePosition - pos).angle())
	if(rot >= -90 and rot <= 90):
		shotgunSprite.flip_v = false
	else:
		shotgunSprite.flip_v = true
		
func recoilAnimation():
	var mousePosition = get_global_mouse_position()
	var pos = global_position
	var rot = rad_to_deg((mousePosition - pos).angle())
	if rot >= -90 and rot <= 90:
		shotgunSprite.rotation_degrees -= 20
	else:
		shotgunSprite.rotation_degrees += 20
	
	
