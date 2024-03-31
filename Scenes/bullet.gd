extends Sprite2D

class_name Bullet
var move_direction: Vector2 = Vector2.ZERO

@export var speed = 200
@export var bulletDamage : float = 25
@export var bulletDuration = 0.15

func _process(delta):
	global_position += move_direction * delta * speed
	await get_tree().create_timer(bulletDuration).timeout
	queue_free()


func on_bullet_hit(body):
	if body.has_method("chicken_take_damage"):
		body.chicken_take_damage(bulletDamage)
		queue_free()
