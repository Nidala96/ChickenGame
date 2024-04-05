extends Area2D

	
func _input(event):
	if event.is_action_pressed("interact"):
		print(get_overlapping_bodies().size())
		if get_overlapping_bodies().size() == 1:
			if get_tree().current_scene.name == "House":
				get_tree().change_scene_to_file("res://Scenes/outside_house.tscn")
				if Global.chickenEvent:
					AudioManager.play("res://Sound/Soundtracks/revenge_start.ogg")
			elif Global.chickenEvent: 
				get_tree().change_scene_to_file("res://Scenes/destroyed_house.tscn")
				AudioManager.play("res://Sound/SFX/murder_scare.ogg")
			else:
				print(get_overlapping_bodies().size())
				get_tree().change_scene_to_file("res://Scenes/house.tscn")
