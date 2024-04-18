extends Area2D


func _on_body_entered(body):
	if body.has_method("walk"):
		get_tree().change_scene_to_file("res://Scenes/forest_level.tscn")
		AudioManager.stop()
		AudioManager.play("res://Sound/Soundtracks/revenge.ogg")
