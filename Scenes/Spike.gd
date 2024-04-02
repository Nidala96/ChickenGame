extends StaticBody2D

var damage:float = 100

func _on_area_2d_body_entered(body):
	if body.has_method("player_take_damage"):
		body.player_take_damage(damage)
		
