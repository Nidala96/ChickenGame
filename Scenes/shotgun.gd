extends Marker2D


var crosshair_texture = preload("res://Assets/crosshair.png")
@onready var bullet_scene = preload("res://Scenes/bullet.tscn")
var node2d
var shotgunSprite


func _ready():
	node2d = %BulletSpawnPoint
	shotgunSprite = %ShotgunSprite

func _physics_process(delta):
	var mouse_position = get_global_mouse_position()
	look_at(mouse_position)
	rotateGun(mouse_position)

func _input(event):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var bullet = bullet_scene.instantiate() as Bullet
	get_tree().root.add_child(bullet)
	var move_direction = (get_global_mouse_position() - global_position).normalized()
	bullet.move_direction = move_direction
	bullet.global_position = node2d.global_position
	bullet.rotation = move_direction.angle()
	
func rotateGun(mouse_position):
	var pos = global_position
	var rot = rad_to_deg((mouse_position - pos).angle())
	print(rot)
	if(rot >= -90 and rot <= 90):
		shotgunSprite.flip_v = false
	else:
		shotgunSprite.flip_v = true
