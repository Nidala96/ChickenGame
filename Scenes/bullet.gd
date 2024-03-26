extends Sprite2D

class_name Bullet
var move_direction: Vector2 = Vector2.ZERO

@export var speed = 200
@export var bulletDamage : float = 25
@export var bulletDuration = 0.3

func _process(delta):
	global_position += move_direction * delta * speed
	await get_tree().create_timer(bulletDuration).timeout
	queue_free()

func _on_area_2d_body_entered(body):
	if body.has_method("chicken_take_damage"):
		body.chicken_take_damage(bulletDamage)
