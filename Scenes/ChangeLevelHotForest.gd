extends Area2D

func _on_body_entered(body):
	if body.has_method("walk"):
		get_tree().change_scene_to_file("res://Scenes/hot_forest_level.tscn")
		
