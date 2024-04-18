extends Node

var player = AudioStreamPlayer.new()

func _ready():
		add_child(player)
		
func stop():
	player.stop()

func play(sound_path):
	player.stream = load(sound_path)
	player.play()


