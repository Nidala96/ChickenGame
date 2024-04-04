extends StaticBody2D


func _on_area_2d_body_entered(body):
	
	if body.has_method("walk"):
		print(Global.chickenEvent)
		Global.chickenEvent = true
		print(Global.chickenEvent)
		queue_free()
